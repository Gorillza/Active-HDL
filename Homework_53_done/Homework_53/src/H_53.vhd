library ieee;
use ieee.std_logic_1164.all;
entity shift is
    generic (
        N: natural := 5
        );
    port (
        clk : in std_logic; 
        d_in : in std_logic;
        q : out std_logic_vector (N-1 downto 0):=(others =>'0') 
        );
end shift; 


architecture rtl of shift is
begin
    
    process (clk)
    begin
        if (clk'event and clk = '1') then --если сlk изменилось и оно равно 1 то мы зайдем в иф 
           q <= q sll 1;
           q(0) <= d_in;
        end if;
    end process;
end rtl;