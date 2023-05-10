library ieee;
library work;
use work.utils.somador_completo;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity somador is
	generic( tamanho : integer := 32);
	port(
		a, b		: in  std_logic_vector(tamanho - 1 downto 0);
		subtracao: in  std_logic;
		Ov, Cout	: out std_logic;
		saida 	: out std_logic_vector(tamanho - 1 downto 0)
	);
end somador;

architecture behavior of somador is

	signal c			: std_logic_vector(tamanho downto 0) := (0 => subtracao, others => '0');
	signal menos_b : std_logic_vector(tamanho - 1 downto 0);
begin
	c(0) <= subtracao;
	
	menos_b <= (not b) when subtracao = '1' else b;
	
	Bits: for index in 0 to tamanho - 1 generate
		b: somador_completo port map(
			a => a(index),
			b => menos_b(index),
			carry_in	=> c(index),
			carry_out => c(index + 1),
			saida	=> saida(index)
		);
	end generate;
	
	Cout <= c(tamanho - 1);
	Ov <= c(tamanho - 1) XOR c(tamanho - 2);
	
end behavior;
