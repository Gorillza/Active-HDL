-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : H1
-- Author      : gorilas
-- Company     : MGTU
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\Homework_1\H1\compile\log_func.vhd
-- Generated   : Thu Sep 22 19:35:31 2022
-- From        : c:\My_Designs\Homework_1\H1\src\log_func.bde
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
  port(
       x1 : in BIT;
       x2 : in BIT;
       x3 : in BIT;
       f : out BIT
  );
end log_func;

architecture rtl1 of log_func is

begin

---- User Signal Assignments ----
f <= (x1 or x2) or ((x1 xor x3) and (x2 and x3));

end rtl1;
