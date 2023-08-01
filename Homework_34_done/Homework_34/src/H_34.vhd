library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity log_func is
    generic
        (
        N:natural:=3; -- ��������� ������
        a:natural:=2  --��������� ��� ���������� � �������
        
        );
    port
        (
        x1 : in std_logic_vector(N-1 downto 0);  --����
        ez : in std_logic;                       --������������ ����
        f : out std_logic_vector(a**(N)-1 downto 0) --������ ��� �������� ��������
        );
end log_func;



architecture decN_Z of log_func is
    
    signal Zc:std_ulogic_vector(a**(N)-1 downto 0);   --������ ��������� ������ ������������ � ��������
    signal MinOut:std_ulogic_vector(a**(N)-1 downto 0):=(others =>'0'); --����������
    
begin
    
    Zc<=(others=>'Z');
    --���������������� ���� ������ "Z"
    MinOut <= MinOut(MinOut'high downto 1)&'1';        --��������� ����������� ������� 1 � ��������� 0

    --g <= to_integer(unsigned(x1));          -- ������������ ������� �������������� ����� ��� ���� ����� �������� �������
    
    f <=
    (MinOut sll to_integer(unsigned(x1))) when ez = '0' else
    Zc;
    
end decN_Z;