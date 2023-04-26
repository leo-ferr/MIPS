LIBRARY IEEE;
LIBRARY WORK;
USE WORK.UTILS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY mux_2_1 IS
	PORT(
		in_0, in_1	: IN  STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0);
		sel 			: IN  STD_LOGIC;
		saida			: OUT STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0)
	);
END mux_2_1;

ARCHITECTURE behavior OF mux_2_1 IS

BEGIN

	saida <= in_0 WHEN (sel = '0') ELSE
				in_1 WHEN (sel = '1');
	
END behavior;