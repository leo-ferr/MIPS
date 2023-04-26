library ieee;
library work;
use work.utils.all;
use ieee.std_logic_1164.all;


entity MIPS is
	port(
		clk : std_logic;
		reset : std_logic
	);

end entity;

architecture arq of MIPS is

	constant tamanho : integer := 32;
	signal entrada_PC, saida_PC : std_logic_vector(tamanho - 1 downto 0);
	signal saida_somador_prox_instru : std_logic_vector(tamanho - 1 downto 0);
	signal instrucao : std_logic_vector(tamanho - 1 downto 0);

begin

	PC : registrador port map(
		data => entrada_PC,
		clock => clk,
		clear => reset,
		enable => '1'
		q => saida_PC
	);

	somador_instru:  
		somador 
			generic map( width => 32); 
			port map(
				a => saida_PC,
				b => x"FFFFFFF" & "0100" -- 4 em 5 bits
				carry_in => '0',
				ov => open,
				Cout => open,
				saida => saida_somador_prox_instru
			);
	
	RAM : memoria_ram port map(
		clock => , clk,
		data => x"FFFFFFFF",
		rdaddress => saida_PC,
		wraddress => x"00000000",
		q => instrucao
	);

	banco_regs : banco_registradores 
		port map(
			reg_ler1 => instrucao(),
			reg_ler2 => ,
			reg_escrever => ,
			dado_escrever => ,
			dado_lido1 =>,
			dado_lido2 => ,

			regs_dest => ,
			escr_reg => ,
			clock => ,
			reset => ,

		);

end arq;