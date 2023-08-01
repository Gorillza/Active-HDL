library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity penc is
    generic(
        N:natural:=4
        );
    port (
        raz : in std_logic;
        
        d_in : in std_logic_vector((N**2-1) downto 0);
        Q : out std_logic_vector((N-1) downto 0):=(others =>'0')
        );
end entity penc;




architecture rtl5 of penc is
     
begin
    
    process (raz)    
        function f_log2(x:std_logic_vector) return integer is 
            variable i : integer;
            variable num : integer:=0;
        begin
            num:=to_integer(unsigned(x));
            i:=0;
            while (2**i <=num) and i<31 loop
                i:=i+1;
            end loop;
            if(i<=0) then    
                return i;
            else
                return i-1;
            end if;
        end  f_log2;
        
        --конец обьявления
        variable zum :natural:=0;
        
    begin
        if rising_edge(raz) then
        zum:=f_log2(d_in);
        Q<=std_logic_vector(to_unsigned((zum),Q'length));
        end if;
        Q<=std_logic_vector(to_unsigned((zum),Q'length));
    end process;
end architecture rtl5;
--00000110000110000
--00000100000000000



