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

        -- 32-bit Q15 inputs
        x_in    : in  signed(31 downto 0);
        y_in    : in  signed(31 downto 0);

        -- 32-bit Q15 outputs
        x_out   : out signed(31 downto 0);
        z_out   : out signed(31 downto 0);

        done    : out std_logic
    );
end entity cordic_vectoring;


architecture rtl of cordic_vectoring is

    ----------------------------------------------------------------
    --Q15 format
    --
    -- 32 bits total
    -- 16 integer bits
    -- 15 fractional bits
    --
    -- fixed_point_value = real_value * 2^15
    ----------------------------------------------------------------

    ----------------------------------------------------------------
    -- atan(2^-i) lookup table
    ----------------------------------------------------------------
    type atan_table_t is array (0 to ITERATIONS-1)
        of signed(31 downto 0);

    --15 iterations of atan(2^-i) in Q15 format
    constant ATAN_TABLE : atan_table_t := (
    to_signed(25736, 32), -- atan(2^-0) = 0.785398163397
    to_signed(15193, 32), -- atan(2^-1) = 0.463647609001
    to_signed(8027, 32), -- atan(2^-2) = 0.244978663127
    to_signed(4075, 32), -- atan(2^-3) = 0.124354994547
    to_signed(2045, 32), -- atan(2^-4) = 0.062418809996
    to_signed(1024, 32), -- atan(2^-5) = 0.031239833430
    to_signed(512, 32), -- atan(2^-6) = 0.015623728620
    to_signed(256, 32), -- atan(2^-7) = 0.007812341060
    to_signed(128, 32), -- atan(2^-8) = 0.003906230132
    to_signed(64, 32), -- atan(2^-9) = 0.001953122516
    to_signed(32, 32), -- atan(2^-10) = 0.000976562190
    to_signed(16, 32), -- atan(2^-11) = 0.000488281211
    to_signed(8, 32), -- atan(2^-12) = 0.000244140620
    to_signed(4, 32), -- atan(2^-13) = 0.000122070312
    to_signed(2, 32) -- atan(2^-14) = 0.000061035156
);

    ----------------------------------------------------------------
    -- Internal Q15 registers
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