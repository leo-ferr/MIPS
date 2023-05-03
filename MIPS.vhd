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
	signal saida_somador_ula : std_logic_vector(tamanho - 1 downto 0);
	signal instrucao : std_logic_vector(tamanho - 1 downto 0);

	signal dado_escrever : std_logic_vector(tamanho - 1 downto 0);
	signal dado_lido1_regs, dado_lido2_regs : std_logic_vector(tamanho - 1 downto 0);

	---- sinais de controle
	signal regs_dest 			: std_logic;
	signal desvio      		: std_logic;
	signal memoria_leitura 	: std_logic;
	signal mux_memoria 		: std_logic;
	signal ula_op          	: std_logic;
	signal memoria_escrita 	: std_logic;
	signal ula_fonte   		: std_logic;
	signal escr_reg 			: std_logic;
	
	signal ula_saida 			: std_logic;
	signal entrada_b_ula: std_logic_vector(tamanho - 1 downto 0);
	signal extensao_sinal  :std_logic_vector(tamanho - 1 downto 0);
	
begin

	extensao_sinal <= x"FFFF" & instrucao(15 downto 0) when instrucao(15) = '1' else
							X"0000" & instrucao(15 downto 0) when instrucao(15) = '0';

	PC : registrador port map(
		data => entrada_PC,
		clock => clk,
		clear => reset,
		enable => '1',
		q => saida_PC
	);

	somador_instru:  
			somador
			generic map( width => 32)
			port map(
				a => saida_PC,
				b => x"FFFFFFF" & "0100", -- 4 em 5 bits
				carry_in => '0',
				ov => open,
				Cout => open,
				saida => saida_somador_prox_instru
			);
	
	RAM : memoria_ram port map(
		clock => clk,
		data => x"FFFFFFFF",
		rdaddress => saida_PC,
		wraddress => x"00000000",
		q => instrucao
	);

	CONTROLE : controle port map(
		instru => instrucao(31 downto 26),

		regs_dest => regs_dest,
      desvio      => desvio,	-- fontePC
      memoria_leitura => memoria_leitura,
      mux_memoria => mux_memoria,
      ula_op          => ula_op,
      memoria_escrita => memoria_escrita,
      ula_fonte   => ula_fonte,
      escr_reg => escr_reg

	);

	BANCO_REGS : banco_registradores 
		port map(
			reg_ler1 => instrucao(25 downto 21),
			reg_ler2 => instrucao(20 downto 16),
			reg_escrever => instrucao(15 downto 11),
			dado_escrever => dado_escrever,
			dado_lido1 => dado_lido1_regs,
			dado_lido2 => dado_lido2_regs,

			regs_dest => regs_dest,
			escr_reg => escr_reg,
			clock => clk,
			reset => reset
		);
		
	mux_entrada_ula: entrada_b_ula <= dado_lido2_regs when ula_fonte = '0' else
												extensao_sinal when ula_fonte = '1';

	ULA : ula port map(
			a => dado_lido1_regs,
			b	=> entrada_b_ula,
			op	=> ula_op,
			Ov => open, 
			Cout => open,
			saida => ula_saida
	);
	
--	somador_desvio:  
--			somador
--			generic map( width => 32); 
--			port map(
--				a => saida_somador_prox_instru,
--				b => EXTENSAO SINAL + DESLOCAMENTO ESQUERDA instrucao(15 downto 0),
--				carry_in => '0',
--				ov => open,
--				Cout => open,
--				saida => saida_somador_ula
--			);

end arq;