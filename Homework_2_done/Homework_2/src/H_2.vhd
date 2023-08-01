library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity log_func is
	port (
		x1 : in bit;
		x2 : in bit;
		x3 : in bit;
		x4 : in bit;
		f  : out bit
		);
end log_func;

-- rtl1	 если обьеденить последние два 
--  x1  x2  x3  x4  f 
--  0	0	0	0	0
--	0	0	0	1	0
--	0	0	1	0	0
--	0	0	1	1	0
--	0	1	0	0	0
--	0	1	0	1	1
--	0	1	1	0	0
--	0	1	1	1	0
--	1	0	0	0	1
--	1	0	0	1	1
--	1	0	1	0	1
--	1	0	1	1	1
--	1	1	0	0	1
--	1	1	0	1	1
--	1	1	1	0	1
--	1	1	1	1	1

architecture rtl1 of log_func is
begin
	f <= x1 Or ((x2 and not x3) and (not x1 and x4));
end rtl1;

