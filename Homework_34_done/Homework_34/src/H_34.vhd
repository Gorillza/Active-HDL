library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity log_func is
    generic
        (
        N:natural:=3; -- количетво входов
        a:natural:=2  --пременная для возведения в степень
        
        );
    port
        (
        x1 : in std_logic_vector(N-1 downto 0);  --вход
        ez : in std_logic;                       --регулирующий вход
        f : out std_logic_vector(a**(N)-1 downto 0) --вектор для выходных значений
        );
end log_func;



architecture decN_Z of log_func is
    
    signal Zc:std_ulogic_vector(a**(N)-1 downto 0);   --создан временный вектор размерностью с выходным
    signal MinOut:std_ulogic_vector(a**(N)-1 downto 0):=(others =>'0'); --анологично
    
begin
    
    Zc<=(others=>'Z');
    --инициализировали весь вектор "Z"
    MinOut <= MinOut(MinOut'high downto 1)&'1';        --присвоили наименьшему разряду 1 а остальным 0

    --g <= to_integer(unsigned(x1));          -- использовали двоеное преобразование типов для того чтобы получить интегер
    
    f <=
    (MinOut sll to_integer(unsigned(x1))) when ez = '0' else
    Zc;
    
end decN_Z;