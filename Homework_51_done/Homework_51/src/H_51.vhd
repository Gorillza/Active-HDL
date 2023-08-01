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
    --��������:��� ��������� � ���������� ������� � ������� �� ������� ������������ 
    --         int  � y �� �� y ������� �� int  � y ��� ������������ �������� (��� 
    --          ��� ����� �� ���������) � ������ �� ������� ���� �� ����� ������ y 
    --          ������ ������ ����� ���������� �� �� ��� ��� �������� �� �� ��� ����� �������� �
    --          � int ����� ������ �������� 
    
    process (x)
    begin
        int <= x;
        y   <= not int;
    end process;
    
    
    --������ �������:��� ��������� �������� ������� �� � ����������� �������
    --               ������ �������� �� �������� �������� int � ��� �������� �
    --               ���������� ������ �������� � ��������� �������� int 
    /*
    process (x,int)
    begin
        int <= x;
        y   <= not int;
    end process;
    */
    
    --������ �������:��� ��������� � ����������� ������� � ������ �������� �� 
    --               ���������� ������������� �������� � ����� y
    /*
    process (x)
    begin
        y   <= not x;
    end process;
    */
    
    --������� ������:��� �������� ���������� ��������� �� ���������� ����������
    --               � ����� ���������� ����� ������� �� ��������� ������� �������� �
    --               � ����� � y ������� ���������������� 
    /*
    process (x)
    variable int :std_logic;
    begin
        int := x;
        y   <= not int;
    end process;
    
     */
end architecture rtl;