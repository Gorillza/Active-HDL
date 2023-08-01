library ieee;
use ieee.std_logic_1164.all;

entity and_or_4 is
    generic(
        N: natural := 4
        );
    port (
        enable   : in  std_logic;
        a_or     : out std_logic;
        a_and    : out std_logic;
        x1       : in std_logic_vector (N-1 downto 0);
        f        : out std_logic
        );
end entity and_or_4;

architecture struct of and_or_4 is

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

        or4 : orN
        generic map (
        N => N
        )
        port map(
        x => x1,
        y => a_or
        );


log_func:entity work.log_func(or_vect_n)
    generic map (
    N => N
    )
    port map(
    x1 => x1,
    y1 => a_and
    );
    
    f <= 
  a_or  when enable = '0' else
  a_and when enable = '1' else
  'Z';   
  
-- По умолчанию все созданные модули в проекте 
-- компилируются в библиотеке work 
-- а по синтаксису подключения с помощью 
-- entiti говориться что после данного ключевого 
-- слова следует библиотека в которой находится 
-- скомпилированны компонент 
        
       
       
end architecture struct;