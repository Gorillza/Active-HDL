library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity log_func is
	port (
		D : in std_logic_vector (7 downto 0);
		v2 : in std_logic_vector (2 downto 0);
		f  : out std_logic
		);
end log_func;

--multiplexor
architecture mux8 of log_func is 
begin
	f <=
	D(0)    when v2 = "000"    else
	D(1)    when v2 = "001"    else
	D(2)    when v2 = "010"    else
	D(3)    when v2 = "011"	   else
	D(4)    when v2 = "100"    else
	D(5)    when v2 = "101"    else
	D(6)    when v2 = "110"    else
	D(7)    when v2 = "111"   ;	
end mux8;