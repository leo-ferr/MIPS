library IEEE;
library WORK;
use IEEE.STD_LOGIC_1164.all;

entity registrador is
	generic( tamanho : integer := 32);
	port(
		data 	: in  std_logic_vector(tamanho - 1 downto 0);
		clock	: in  std_logic;
		clear	: in  std_logic;
		enable: in  std_logic;
		q		: out std_logic_vector(tamanho - 1 downto 0)	
	);
end registrador;

architecture behavior of registrador is
begin
	
	process(clock, clear, enable)
	begin
		if clear = '1' then
			q <= (others => '0');
			
		elsif rising_edge(clock) and (enable = '1') then
			q <= data;
			
		end if;
	
	end process;
end behavior;
