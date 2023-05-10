library ieee;
library work;
use ieee.std_logic_1164.all;
use work.utils.somador;

entity calcula_endereco is
   port (
		pc, condicional		: in  std_logic_vector(31 downto 0);
		incondicional  		: in  std_logic_vector(27 downto 0);
		sinal_branch			: in  std_logic;
		sinal_jump				: in  std_logic;
		sinal_zero				: in 	std_logic;
		saida                : out std_logic_vector(31 downto 0)
	);
end calcula_endereco;

architecture structural of calcula_endereco is
   signal saida_condicional : std_logic_vector(31 downto 0);
   signal saida_PC_mais_1 : std_logic_vector(31 downto 0);
   signal mux_1 : std_logic_vector(31 downto 0);
begin

	PC_MAIS_1: somador
		port map(
			a => pc,
			b => x"00000001",	-- 1 em 32 bits
			subtracao => '0',
			ov => open,
			Cout => open,
			saida => saida_PC_mais_1
		);

	somador_condicional: somador
		port map(
			a => saida_PC_mais_1,
			b => condicional,
			subtracao => '0',
			ov => open,
			Cout => open,
			saida => saida_condicional
		);

	mux_1 <= saida_PC_mais_1 when (sinal_branch and sinal_zero) = '0' else
				saida_condicional;
	
	saida <= mux_1 when sinal_jump = '0' else
				("0000" & incondicional) when sinal_jump = '1' ;
            
end structural;
