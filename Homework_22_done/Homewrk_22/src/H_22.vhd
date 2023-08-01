library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity log_func is
	generic (
		N: natural := 3
		);
	port (
		v1 : in std_logic_vector (N-1 downto 0);
		v2 : in std_logic_vector (N-1 downto 0);
		f  : out std_logic_vector(N-1 downto 0)
		);
end log_func;

architecture or_vect_n of log_func is
begin
	f <= v1 or v2;
end or_vect_n;	   