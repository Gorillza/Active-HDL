library ieee;
use ieee.std_logic_1164.all;

entity and_or_4z is
    generic(
        N: natural := 4
        );
    port (
        ez       : in std_logic;
        enable   : in  std_logic;
        a_or     : out std_logic;
        a_and    : out std_logic;
        a_buf    : out std_logic_vector (N-1 downto 0);
        x1       : in std_logic_vector (N-1 downto 0);
        f        : out std_logic
        );
end entity and_or_4z;

architecture struct of and_or_4z is
--обь€вдение переменной дл€ or
component orN
        generic  (
        N : natural
        );
        port (
        x : in std_logic_vector;
        y : out std_logic
        );
    end component;
begin  
--иницализированный экземпл€р or
        or4 : orN
        generic map (
        N => N
        )
        port map(
        x => a_buf,
        y => a_or
        );

--инициализаци€ дл€ and
log_func:entity work.log_func(or_vect_n)
    generic map (
    N => N
    )
    port map(
    x1 => a_buf,
    y1 => a_and
    );
       
  
--инициализаци€
        
log_func_buf:entity work.log_func_buf(buf4) 
	port map(
        EZ =>ez, 
		x2 =>x1,
		y2 => a_buf
		);
       


f <=
  'Z'    when ez = '1'     else
  a_or   when enable = '0' else
  a_and  when enable = '1' 
  ;
end architecture struct;