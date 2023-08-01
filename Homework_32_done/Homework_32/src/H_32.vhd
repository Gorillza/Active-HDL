library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity log_func is
	port (
		D  : in std_logic_vector (2 downto 0); --3 входа
		f  : out std_logic_vector (7 downto 0)--8 выхода
		);
end log_func;

architecture dec3_8 of log_func is
--душифратор с 3 входами 8 выходами
begin
	
	f <=
	"00000001"    when D = "000"  else
    "00000010"    when D = "001"  else
    "00000100"    when D = "010"  else
    "00001000"    when D = "011"  else
    "00010000"    when D = "100"  else
    "00100000"    when D = "101"  else
    "01000000"    when D = "110"  else
    "10000000"    when D = "111" 
    ;
end dec3_8;								