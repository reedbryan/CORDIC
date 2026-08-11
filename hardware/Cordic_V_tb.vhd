library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity tb_cordic_vectoring is
end entity tb_cordic_vectoring;

architecture sim of tb_cordic_vectoring is

    ----------------------------------------------------------------
    -- DUT configuration
    ----------------------------------------------------------------
    constant ITERATIONS : integer := 17;

    ----------------------------------------------------------------
    -- Clock
    ----------------------------------------------------------------
    constant CLK_PERIOD : time := 10 ns;

    signal clk   : std_logic := '0';
    signal reset : std_logic := '1';
    signal start : std_logic := '0';

    signal x_in  : signed(31 downto 0) := (others => '0');
    signal y_in  : signed(31 downto 0) := (others => '0');

    signal x_out : signed(31 downto 0);
    signal z_out : signed(31 downto 0);

    signal done  : std_logic;

    ----------------------------------------------------------------
    -- Q3.29 conversion
    ----------------------------------------------------------------
    constant SCALE : real := 536870912.0; -- 2^29

begin

    ----------------------------------------------------------------
    -- Clock generation
    ----------------------------------------------------------------
    clk <= not clk after CLK_PERIOD / 2;

    ----------------------------------------------------------------
    -- Device Under Test
    ----------------------------------------------------------------
    dut : entity work.cordic_vectoring
        generic map (
            ITERATIONS => ITERATIONS
        )
        port map (
            clk   => clk,
            reset => reset,
            start => start,

            x_in  => x_in,
            y_in  => y_in,

            x_out => x_out,
            z_out => z_out,

            done  => done
        );

    ----------------------------------------------------------------
    -- Test process
    ----------------------------------------------------------------
    test_process : process

        variable cycle_count : integer;
        variable angle_rad   : real;
        variable angle_deg   : real;
        variable x_result    : real;

        ----------------------------------------------------------------
        -- Procedure to run one test
        ----------------------------------------------------------------
        procedure test_vector(
            constant x_value     : in integer;
            constant y_value     : in integer;
            constant expected_deg : in real
        ) is

            variable cycles : integer := 0;
            variable z_real : real;
            variable x_real : real;

        begin

            --------------------------------------------------------
            -- Apply inputs
            --------------------------------------------------------
            x_in <= to_signed(x_value, 32);
            y_in <= to_signed(y_value, 32);

            --------------------------------------------------------
            -- Start pulse
            --------------------------------------------------------
            wait until rising_edge(clk);

            start <= '1';

            wait until rising_edge(clk);

            start <= '0';

            --------------------------------------------------------
            -- Count execution cycles
            --------------------------------------------------------
            cycles := 0;

            while done = '0' loop

                wait until rising_edge(clk);

                cycles := cycles + 1;

            end loop;

            --------------------------------------------------------
            -- Convert Q3.29 result to real
            --------------------------------------------------------
            z_real := real(to_integer(z_out)) / SCALE;
            x_real := real(to_integer(x_out)) / SCALE;

            --------------------------------------------------------
            -- Convert radians -> degrees
            --------------------------------------------------------
            angle_deg := z_real * 180.0 / MATH_PI;

            --------------------------------------------------------
            -- Print results
            --------------------------------------------------------
            report "========================================";

            report "Input X       = " &
                   integer'image(x_value);

            report "Input Y       = " &
                   integer'image(y_value);

            report "X magnitude   = " &
                   real'image(x_real);

            report "Angle (rad)   = " &
                   real'image(z_real);

            report "Angle (deg)   = " &
                   real'image(angle_deg);

            report "Expected (deg)= " &
                   real'image(expected_deg);

            report "Error (deg)   = " &
                   real'image(abs(angle_deg - expected_deg));

            report "Cycles        = " &
                   integer'image(cycles);

            report "========================================";

            --------------------------------------------------------
            -- Small delay before next test
            wait for CLK_PERIOD;

        end procedure;

    begin

        ----------------------------------------------------------------
        -- Reset
        ----------------------------------------------------------------
        reset <= '1';

        wait for 3 * CLK_PERIOD;

        reset <= '0';

        wait until rising_edge(clk);

        -- Test 1
        -- Vector: (1, 0)
        -- Expected angle: 0 degrees
        test_vector(
            x_value      => 536870912, -- 1.0 in Q3.29
            y_value      => 0,
            expected_deg => 0.0
        );

        -- Test 2
        -- Vector: (1, 1)
        -- Expected angle: 45 degrees
        test_vector(
            x_value      => 536870912, -- 1.0
            y_value      => 536870912, -- 1.0
            expected_deg => 45.0
        );

        -- Test 3
        -- Vector: (1, -1)
        -- Expected angle: -45 degrees
        test_vector(
            x_value      => 536870912,
            y_value      => -536870912,
            expected_deg => -45.0
        );

        -- Test 4
        -- Vector: (0, 1)
        -- Expected angle: 90 degrees
        test_vector(
            x_value      => 0,
            y_value      => 536870912,
            expected_deg => 90.0
        );

        -- Test 5
        -- Vector: (1, 0.5)
        -- Expected angle: atan(0.5) = 26.565 degrees
        
        test_vector(
            x_value      => 536870912,
            y_value      => 268435456,
            expected_deg => 26.565051177
        );

        -- Test 6
        -- Vector: (0.5, 1)
        -- Expected angle: atan(2) = 63.435 degrees
        test_vector(
            x_value      => 268435456,
            y_value      => 536870912,
            expected_deg => 63.434948823
        );

        ----------------------------------------------------------------
        -- End simulation
        ----------------------------------------------------------------
        report "All CORDIC tests completed.";

        wait;

    end process;

end architecture sim;