library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity log_func is
	generic (
		N: natural := 4
		);
	port (
		x1 : in std_logic_vector (N-1 downto 0);
		y1  : out std_logic
		);
end log_func;

architecture or_vect_n of log_func is
begin
	y1 <= and x1;
end or_vect_n;	   