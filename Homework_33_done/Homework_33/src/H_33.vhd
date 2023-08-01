library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity log_func is
	port (
        EZ : in std_logic; 
		D  : in std_logic_vector (3 downto 0); --4 �����
		f  : out std_logic_vector (3 downto 0)--4 ������
		);
end log_func;

--������ � 4 �� ������� � ��������
architecture buf4 of log_func is

begin
	
	f <=
	D   when EZ = '0'  else
    "ZZZZ"   when EZ = '1'
    ;
end buf4;