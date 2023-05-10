library ieee;
use ieee.std_logic_1164.all;

entity mux_2_1 IS
	generic(tamanho : integer := 32);
	PORT(
		in_1, in_2	: in  std_logic_vector(tamanho - 1 DOWNTO 0);
		sel			: in  std_logic;
		saida 		: out std_logic_vector(tamanho - 1 DOWNTO 0)
	);
END mux_2_1;

ARCHITECTURE behavior OF mux_2_1 IS
BEGIN
	
	saida <= in_1 WHEN (sel = '1') ELSE in_2;
	
END behavior;
