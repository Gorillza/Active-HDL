library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity inv is
    port (
        x : in std_logic;
        y : out std_logic
    );
end entity inv;

architecture rtl of inv is
    signal int : std_logic;
begin
    --Оригинал:При изменении х вызивается процесс в котором мы изменем одновременно 
    --         int  и y но тк y зависит от int  в y нет опредленного значения (это 
    --          это видно на вейформах) и только со второго раза мы уидим сигнал y 
    --          однако сигнал будет показывать не то что нам хотелось бы тк при новом значении х
    --          в int будет старое значение 
    
    process (x)
    begin
        int <= x;
        y   <= not int;
    end process;
    
    
    --Первый варинат:При изменении входного сигнала на х запускается процесс
    --               внутри которого мы изменяем значение int и это приводит к
    --               повторному запску процесса с измененым значеием int 
    /*
    process (x,int)
    begin
        int <= x;
        y   <= not int;
    end process;
    */
    
    --Второй вариант:При изменении х запускается процесс и внутри процесса мы 
    --               записываем проивополоное значение в выход y
    /*
    process (x)
    begin
        y   <= not x;
    end process;
    */
    
    --Третьий вариат:При создании внутренней переменой ее присвоение происходит
    --               в месте обьявления таким образом мы сохраняем текущее значение х
    --               и можем в y записат инвертировнанную 
    /*
    process (x)
    variable int :std_logic;
    begin
        int := x;
        y   <= not int;
    end process;
    
     */
end architecture rtl;