LIBRARY IEEE;
LIBRARY WORK;
USE WORK.UTILS.somador_completo;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY somador IS
	GENERIC( width : INTEGER := 8);
	PORT(
		a, b		: IN  STD_LOGIC_VECTOR(width - 1 DOWNTO 0);
		carry_in	: IN  STD_LOGIC;
		Ov, Cout	: OUT STD_LOGIC;
		saida 	: OUT STD_LOGIC_VECTOR(width - 1 DOWNTO 0)
	);
END somador;

ARCHITECTURE behavior OF somador IS

	SIGNAL c: STD_LOGIC_vector(width downto 0) := (0 => carry_in, others => '0');
	
BEGIN
	
	menos_b <= (not b) + carry_in when carry_in = '1' else b;
	
	Bits: for index in 0 to width generate
		b: somador_completo port map(
			a => a(index),
			b => menos_b(index),
			carry_in	=> c(index);
			carry_out => c(index + 1);
			saida	=> saida(index)
		);
	end generate;
	
	Cout <= c(width);
	Ov <= c(width) XOR c(width - 1);
	
END behavior;