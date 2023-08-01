library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity penc_tb is
end penc_tb;
    
architecture tb of penc_tb is
        constant N_tb :integer := 4;
        constant CLK_FREQ :integer := 50e6;
        constant CLK_PERIOD : time := 1 sec/CLK_FREQ;
                             
        signal  clk_tb      :std_logic:='0';
         
               
        signal d_in_tb :  std_logic_vector((N_tb**2-1) downto 0):=(others => '0');
        signal q_out_tb :  std_logic_vector((N_tb-1) downto 0):=(others =>'0');
        
        type    test_vec_t   is array (natural range <>) of std_logic_vector (3 downto 0);
        constant  test_vec : test_vec_t :=(
            b"0000",--0     0000  0000      --слева выходные данные справа входной сигнал 
            b"0000",--1     0001  0000
            b"0001",--2     0010  0001
            b"0001",--3     0011  0001
            b"0010",--4     0100  0010
            b"0010",--5     0101  0010
            b"0010",--6     0110  0010
            b"0010",--7     0111  0010
            b"0011", --8     1000  0011
            b"0011", --9     1001  0011
            b"0011", --10    1010  0011
            b"0011", --11    1011  0011
            b"0011", --12    1100  0011
            b"0011", --13    1101  0011
            b"0011", --14    1110  0011
            b"0011" --15    1111  0011
            );      
                    
begin               --12    1100  0011
                    --13    1101  0011
                    --14    1110  0011
                    --15    1111  0011
    clk_tb <= not clk_tb after 20ns;
    
    penc :entity work.penc
    generic map(
        N =>N_tb
        )
    port map(
        raz => clk_tb,
        
        d_in => d_in_tb,
        Q =>q_out_tb
    );
 
    
    

    
    
    sim : process  is
        variable penc_out : std_logic_vector((N_tb-1) downto 0):=(others =>'0');
    begin 
        report "start test";
        
        for i in 0 to 15 loop
            d_in_tb<= std_logic_vector((to_unsigned(i,16)));
            wait for CLK_PERIOD/4;
            wait until rising_edge(clk_tb);
            penc_out :=q_out_tb;
            wait for 4*CLK_PERIOD; 
            
            assert q_out_tb=test_vec(i) --запрос на проверку правиьности данных
            report  "in:"& to_string(i)
             & "; out: " & to_string(q_out_tb) & " n_out: "& to_string(test_vec(i))    severity error;
            
        end loop;   
        report "end test";   
        std.env.finish;
                   
    end process sim;
end tb;