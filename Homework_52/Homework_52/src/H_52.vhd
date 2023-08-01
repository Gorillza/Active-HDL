library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sum_v1 is
    port (
        c_in, a, b : in std_logic;
        s, c_out   : out std_logic
    );
end entity sum_v1;

architecture rtl of sum_v1 is
    signal p, g : std_logic;
begin
    process (all)
    begin
        p <= a xor b;
        g <= a and b;
        s <= p xor c_in;
        c_out <= g or (p and c_in);
    end process;
end architecture rtl;



/*
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sum_v1 is
    port (
        c_in, a, b : in std_logic;
        s, c_out   : out std_logic
    );
end entity sum_v1;

architecture rtl of sum_v1 is
begin
    process (all)
        variable p, g : std_logic;
    begin
        p := a xor b;
        g := a and b;
        s     <= p xor c_in;
        c_out <= g or (p and c_in);
    end process;
end architecture rtl;

*/