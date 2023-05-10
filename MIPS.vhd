library ieee;
library work;
use work.utils.all;
use ieee.std_logic_1164.all;


entity MIPS is
	port(
		clk 	: in std_logic;
		reset : in std_logic
		-- instrucao : in std_logic_vector(31 downto 0)
	);
end entity;

---- ARQUITETURA -------

architecture arq of MIPS is
	constant tamanho : integer := 32;
	
	-- instrução: opcode + reg_src_1 + reg_src_2 + reg_dest + shamt + func
	--  32 bits :    6   +    5      +    5      +    5     +   5   +  6

	signal instrucao : std_logic_vector(tamanho - 1 downto 0);

	signal prox_endereco, endereco : std_logic_vector(tamanho - 1 downto 0);

	signal saida_somador_prox_instru : std_logic_vector(tamanho - 1 downto 0);
	signal saida_somador_ula 			: std_logic_vector(tamanho - 1 downto 0);
	signal saida_memoria_dados			: std_logic_vector(tamanho - 1 downto 0);

	signal dado_escrever 						 : std_logic_vector(tamanho - 1 downto 0);
	signal dado_lido1_regs, dado_lido2_regs : std_logic_vector(tamanho - 1 downto 0);

	---- sinais de controle
	signal regs_dest 			: std_logic;
	signal jump     			: std_logic;
	signal branch				: std_logic;
	signal ler_mem			 	: std_logic;
	signal mem_para_reg 		: std_logic;
	signal ula_op          	: std_logic_vector(2 downto 0);
	signal esc_mem 			: std_logic;
	signal ula_fonte   		: std_logic;
	signal escr_reg 			: std_logic;
	
	signal zero_ula			: std_logic;
	signal saida_ula 			: std_logic_vector(tamanho - 1 downto 0);
	signal entrada_b_ula		: std_logic_vector(tamanho - 1 downto 0);
	signal extensao_sinal  	: std_logic_vector(tamanho - 1 downto 0);
	
begin

	PC : registrador 
		port map(
			data   => prox_endereco,
			clock  => clk,
			clear  => reset,
			enable => '1',
			q 		 => endereco
		);

	-- calcula o endereco da próxima intrução considerando
	-- os desvios incondicional e condicional
	DESVIO:  calcula_endereco 
		port map(
			pc => endereco,
			incondicional => instrucao(27 downto 0),
			condicional => extensao_sinal,	-- extensao_sinal linha 109
			sinal_branch => branch,
			sinal_jump => jump,
			sinal_zero => zero_ula,
			saida => prox_endereco
		);

	-- memória para as instruções
	MEM1 : memoria_instrucoes port map(
		endereco => endereco(6 downto 0),
		q 		  => instrucao
	);

	UNIDADE_DE_CONTROLE : controle port map(
		opcode => instrucao(31 downto 26),

		regs_dest 		=> regs_dest,
      jump 				=> jump,
		branch 			=> branch,
      esc_mem 			=> esc_mem,
      mem_para_reg 	=> mem_para_reg,
      ula_op 		 	=> ula_op,
      ler_mem 			=> ler_mem,
      ula_fonte 		=> ula_fonte,
      escr_reg 		=> escr_reg

	);

	BANCO_REGS : banco_registradores 
		port map(
			reg_ler1 		=> instrucao(25 downto 21),
			reg_ler2 		=> instrucao(20 downto 16),
			reg_escrever 	=> instrucao(15 downto 11),
			dado_escrever 	=> dado_escrever,
			dado_lido1 		=> dado_lido1_regs,
			dado_lido2 		=> dado_lido2_regs,

			regs_dest 	=> regs_dest,
			escr_reg  	=> escr_reg,
			clock 		=> clk,
			reset 		=> reset
		);
	
	extensao_sinal <= x"FFFF" & instrucao(15 downto 0) when instrucao(15) = '1' else
							x"0000" & instrucao(15 downto 0);

	mux_entrada_ula: entrada_b_ula <= dado_lido2_regs when ula_fonte = '0' else
												  extensao_sinal when ula_fonte = '1';

	ULA_c : ula port map(
			a 		=> dado_lido1_regs,
			b		=> entrada_b_ula,
			op		=> ula_op,
			Zero 	=> zero_ula,
			Ov 	=> open,
			Cout 	=> open,
			saida => saida_ula
	);

	MEM2: memoria_dados
		port map
		(
			endereco => saida_ula(6 downto 0),
			clock	=> clk,
			dado => dado_lido2_regs,
			rden => ler_mem,
			wren => esc_mem,
			q => saida_memoria_dados
		);

	dado_escrever <= saida_memoria_dados when mem_para_reg = '1' else
							saida_ula when mem_para_reg = '0';
end arq;
