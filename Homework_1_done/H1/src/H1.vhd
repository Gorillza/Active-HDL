library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity log_func is
    port (
        x1 : in bit;
        x2 : in bit;
        x3 : in bit;
        f  : out bit
    );
end log_func;


-- rtl1
--  x1  x2  x3  f
--  0 	0	0	0
--	0	0	1	0
--	0	1	0	0
--	0	1	1	1
--	1	0	0	0
--	1	0	1	1
--	1	1	0	1
--	1	1	1	1

architecture rtl1 of log_func is
begin
    f <= (x1 and x2) or (x1 and x3) or (x2 and x3) after 50 ns;
end rtl1;
--используется инерционная модель задержки что подразусевает не
--воспринимание импульсов меньшей длительности чем сама задержка поэтому 

configuration logic_func_conf of log_func is
    for rtl1
    end for;
end configuration logic_func_conf;