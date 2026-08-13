library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cordic_vectoring is
    generic (
        ITERATIONS : integer := 15
    );
    port (
        clk     : in  std_logic;
        reset   : in  std_logic;

        start   : in  std_logic;

        -- 32-bit Q3.29 inputs
        x_in    : in  signed(31 downto 0);
        y_in    : in  signed(31 downto 0);

        -- 32-bit Q3.29 outputs
        x_out   : out signed(31 downto 0);
        z_out   : out signed(31 downto 0);

        done    : out std_logic
    );
end entity cordic_vectoring;


architecture rtl of cordic_vectoring is

    ----------------------------------------------------------------
    -- Q3.29 format
    --
    -- 32 bits total
    -- 3 integer bits
    -- 29 fractional bits
    --
    -- fixed_point_value = real_value * 2^29
    ----------------------------------------------------------------

    ----------------------------------------------------------------
    -- atan(2^-i) lookup table
    ----------------------------------------------------------------
    type atan_table_t is array (0 to ITERATIONS-1)
        of signed(31 downto 0);

    --17 iterations of atan(2^-i) in Q3.29 format
    constant ATAN_TABLE : atan_table_t := (
        to_signed(421657428, 32), -- atan(2^0)
        to_signed(248918915, 32), -- atan(2^-1)
        to_signed(131521918, 32), -- atan(2^-2)
        to_signed( 66762526, 32), -- atan(2^-3)
        to_signed( 33458859, 32), -- atan(2^-4)
        to_signed( 16762184, 32), -- atan(2^-5)
        to_signed(  8388346, 32), -- atan(2^-6)
        to_signed(  4194218, 32), -- atan(2^-7)
        to_signed(  2097127, 32), -- atan(2^-8)
        to_signed(  1048560, 32), -- atan(2^-9)
        to_signed(   524288, 32), -- atan(2^-10)
        to_signed(   262144, 32), -- atan(2^-11)
        to_signed(   131072, 32), -- atan(2^-12)
        to_signed(    65536, 32), -- atan(2^-13)
        to_signed(    32768, 32), -- atan(2^-14)
        to_signed(    16384, 32), -- atan(2^-15)
        to_signed(     8192, 32)  -- atan(2^-16)
    );

    ----------------------------------------------------------------
    -- Internal Q3.29 registers
    ----------------------------------------------------------------
    signal x_reg : signed(31 downto 0);
    signal y_reg : signed(31 downto 0);
    signal z_reg : signed(31 downto 0);

    signal iteration : integer range 0 to ITERATIONS-1;
    ----------------------------------------------------------------
    -- Controller states
    ----------------------------------------------------------------
    type state_type is (IDLE, CALCULATE, FINISH);
    signal state : state_type;

begin
    ----------------------------------------------------------------
    -- Main CORDIC controller
    ----------------------------------------------------------------
    process(clk)

        variable x_shift : signed(31 downto 0);
        variable y_shift : signed(31 downto 0);

        variable x_next  : signed(31 downto 0);
        variable y_next  : signed(31 downto 0);
        variable z_next  : signed(31 downto 0);

    begin

        if rising_edge(clk) then

            if reset = '1' then

                x_reg     <= (others => '0');
                y_reg     <= (others => '0');
                z_reg     <= (others => '0');

                iteration <= 0;

                x_out     <= (others => '0');
                z_out     <= (others => '0');

                done      <= '0';

                state     <= IDLE;

            else

                done <= '0';

                case state is
                    ------------------------------------------------
                    -- Wait for input
                    ------------------------------------------------
                    when IDLE =>

                        if start = '1' then

                            x_reg <= x_in;
                            y_reg <= y_in;

                            -- z_temp = 0
                            z_reg <= (others => '0');

                            iteration <= 0;

                            state <= CALCULATE;

                        end if;
                    ------------------------------------------------
                    -- Perform one CORDIC iteration per clock
                    ------------------------------------------------
                    when CALCULATE =>
                        ------------------------------------------------
                        -- Arithmetic right shifts
                        --
                        -- Equivalent to:
                        -- x_temp_1 >> i
                        -- y_temp_1 >> i
                        --
                        -- Because signed values, this is
                        -- an arithmetic right shift.
                        ------------------------------------------------

                        x_shift := shift_right(x_reg, iteration);
                        y_shift := shift_right(y_reg, iteration);

                        ------------------------------------------------
                        -- Vectoring CORDIC
                        --
                        -- if (y_temp_1 > 0)
                        ------------------------------------------------
                        if y_reg > 0 then

                            -- x_temp_2 =
                            -- x_temp_1 + (y_temp_1 >> i)

                            x_next := x_reg + y_shift;

                            -- y_temp_2 =
                            -- y_temp_1 - (x_temp_1 >> i)

                            y_next := y_reg - x_shift;

                            -- z_temp += z_table[i]

                            z_next := z_reg + ATAN_TABLE(iteration);

                        else

                            -- x_temp_2 =
                            -- x_temp_1 - (y_temp_1 >> i)

                            x_next := x_reg - y_shift;

                            -- y_temp_2 =
                            -- y_temp_1 + (x_temp_1 >> i)

                            y_next := y_reg + x_shift;

                            -- z_temp -= z_table[i]

                            z_next := z_reg - ATAN_TABLE(iteration);

                        end if;


                        ------------------------------------------------
                        -- Store results this iteration
                        ------------------------------------------------
                        x_reg <= x_next;
                        y_reg <= y_next;
                        z_reg <= z_next;
                        ------------------------------------------------
                        -- Check if this was the final iteration
                        ------------------------------------------------

                        if iteration = ITERATIONS - 1 then

                            -- Return final x and z
                            x_out <= x_next;
                            z_out <= z_next;

                            state <= FINISH;

                        else

                            iteration <= iteration + 1;

                        end if;


                    ------------------------------------------------
                    -- Signal completion
                    ------------------------------------------------
                    when FINISH =>

                        done <= '1';

                        state <= IDLE;

                end case;

            end if;

        end if;

    end process;

end architecture rtl;