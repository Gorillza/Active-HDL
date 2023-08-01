library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity log_func_buf is
	port (
        EZ : in std_logic; 
		x2  : in std_logic_vector (3 downto 0); --4 входа
		y2  : out std_logic_vector (3 downto 0)--4 выхода
		);
end log_func_buf;

--буффер с 4 мя входами и выходами
architecture buf4 of log_func_buf is

begin
	
    
    y2 <=
    x2 when EZ = '0'else
    "ZZZZ";
    
end buf4;