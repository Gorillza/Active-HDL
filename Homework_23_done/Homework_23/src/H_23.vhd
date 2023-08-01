library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity log_func is
	port (
		x1 : in std_logic;
		x2 : in std_logic;
		enable :in std_logic;
		f  : out std_logic
		);
end log_func;

architecture cod2 of log_func is
signal zero: std_logic :='0';
signal one: std_logic :='1';
signal Z :std_logic := 'Z' ;
signal X :std_logic := 'X' ;
begin
	f <=
	Z      when enable = '0'                    else
	one     when (x2 = '1' and enable = '1')    else
	zero   when (x1 = '1' and enable = '1')     else
	
	X;	
end cod2;