-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : Homework_34
-- Author      : gorilas
-- Company     : MGTU
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\Homework_34\Homework_34\compile\log_func.vhd
-- Generated   : Mon Oct 10 18:32:24 2022
-- From        : C:\My_Designs\Homework_34\Homework_34\src\log_func.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library ieee;
use ieee.std_logic_1164.all;
use ieee.NUMERIC_STD.all;

entity log_func is
  generic(
       N : natural := 3;
       a : natural := 2
  );
  port(
       x1 : in STD_LOGIC_VECTOR(N - 1 downto 0);
       ez : in STD_LOGIC;
       f : out STD_LOGIC_VECTOR(a ** (N) - 1 downto 0)
  );
end log_func;

architecture decN_Z of log_func is

---- Signal declarations used on the diagram ----

signal MinOut : STD_ULOGIC_VECTOR(a ** (N) - 1 downto 0);
signal Zc : STD_ULOGIC_VECTOR(a ** (N) - 1 downto 0);

begin

---- User Signal Assignments ----
Zc <= (others => 'Z');
MinOut <= (0 => '1', others => '0');
f <= (MinOut sll to_integer(unsigned(x1))) when ez = '0' else Zc;

end decN_Z;
