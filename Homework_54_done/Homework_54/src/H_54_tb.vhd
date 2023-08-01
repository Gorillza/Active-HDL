library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity penc_tb is
end penc_tb;
    
architecture tb of mux_tb is
        constant CLK_FREQ :integer := 50e6;
        constant CLK_PERIOD : time := 1 sec/CLK_FREQ;
        
        signal  N_tb      : natural:=4;
        signal  raz_tb     : std_logic := '0'; 
        signal  d_in_tb     : std_logic_vector((N**2-1) downto 0):="000000000000"; 
        signal  Q_tb :   std_logic_vector((N-1) downto 0) :="0000"; 
               
begin
    
    penc1 :entity work.H_54 is
    generic map(
        N => N_tb
        )
    port map(
        raz => raz_tb,
        d_in => d_in_tb,
        Q => Q_tb
        );

    
    sim : process 
    variable penc_out : std_logic_vector (4 downto 0);
    begin 
        report "start test";
        for i in 0 to 15 loop
            for j in 0 to 15 loop
                if (raz'event and clk = '1') then --если сlk изменилось и оно равно 1 то мы зайдем в иф 
                   q <= q sll 1;
                   q(0) <= d_in;
                end if;
                b_tb <= std_logic_vector(to_unsigned(j,4));
                cin_tb <= '0';
                wait for 2*CLK_PERIOD;                                                                      -- подождали чтобы на выходе что то появилось
                sum_out := sum_tb;                                                                          --запсали выход 
                test_out :=  std_logic_vector(to_unsigned(i+j,5));
                 
                assert  sum_out=test_out or sum_out=test_out_1                                              --савнили выход с заранее известными параметрами
                report  "in:"& to_string(test_out)
                & "; out: " & to_string(sum_out)   &";  need out: " & to_string(test_out)    severity error;

            end loop;
        end loop;
        report "end test";
        std.env.finish;
        
    end process sim;
end tb;	