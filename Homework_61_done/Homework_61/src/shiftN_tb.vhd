library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity shift_tb is
end shift_tb;
    
architecture tb of shift_tb is
        constant N :integer := 5;
        constant CLK_FREQ :integer := 50e6;
        constant CLK_PERIOD : time := 1 sec/CLK_FREQ;
                             
        signal  clk_tb      :std_logic:='0';
               
        signal  d_in_tb     :std_logic:='0';
        signal  q_out_tb       :std_logic_vector (N-1 downto 0):=(others =>'0');
        
        type    test_vec_t   is array (natural range <>) of std_logic_vector (5 downto 0);
        constant  test_vec : test_vec_t :=(
            b"00000_0",  --слева выходные данные справа входной сигнал 
            b"00001_1",
            b"00010_0",
            b"00101_1",
            b"01010_0",
            b"10101_1",
            b"01010_0",
            b"10101_1"
            
        );
               
begin
    clk_tb <= not clk_tb after 50 ns;
    
    shift :entity work.shift    --иницализация компонента 
    generic map(
        N =>N
        )
    port map(
        clk => clk_tb, 
        d_in => d_in_tb,
        q => q_out_tb 
        );
    
    
    sim : process 
        variable shift_out : std_logic_vector (4 downto 0);
    begin 
        report "start test";
        
        for i in 0 to 7 loop
                d_in_tb<=test_vec(i)(0);                --подача на вход компонента сигнала
                wait until rising_edge(clk_tb);         --проверка разрешающего сигнала               
                wait for 2*CLK_PERIOD;                  -- ожидание для получения обратной связи 
                shift_out :=q_out_tb;                   --запись полученных данных в переменную
                
                assert q_out_tb=test_vec(i)(5 downto 1) --запрос на проверку правиьности данных
                report  "in:"& to_string(test_vec(i)(0))
                & "; out: " & to_string(shift_out) & " n_out: "&to_string(test_vec(i)(5 downto 1))    severity error;
        end loop;   
        report "end test";   
        std.env.finish;
        
    end process sim;
end tb;