library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity counterUpDown is
    generic (
        N : positive := 8
        );
    port (
        rst_n : in std_logic;
        clk : in std_logic;
        
        Sn  : in std_logic;--вход разрешения записи
        en  : in std_logic;--вход разрешения записи
        D : in std_ulogic_vector(N - 1 downto 0); --ходы для записи 
        cnt : out std_ulogic_vector(N - 1 downto 0) -- выходы счетчика
        );
end entity counterUpDown;
architecture rtl of counterUpDown is
begin
    process (clk,rst_,en)
    variable int : std_logic_vector(cnt'range) := (others => '0');
    variable plus_one : integer :=0 ;
    
    begin
        plus_one:=to_integer(unsigned(int))+1;
        
        if rst_n = '0' then
            int := (others => '0');
        else
            if en then
                if rising_edge(clk) then
                    if Sn then 
                        int := D;
                    else
                        int := std_logic_vector(to_unsigned(plus_one,N));
                    end if;
                end if;
            else
                int := (others =>'Z');
            end if;
        end if;
        cnt <= int;
    end process;
end architecture rtl;