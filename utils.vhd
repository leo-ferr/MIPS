library ieee;
use ieee.std_logic_1164.all;

package utils is
	component mux_2_1 is
		generic(tamanho : integer := 32);
		port(
			in_1, in_2	: in  std_logic_vector(tamanho - 1 downto 0);
			sel			: in  std_logic;
			saida 		: out std_logic_vector(tamanho - 1 downto 0)
		);
	end component;

	component calcula_endereco is
		port (
			pc, condicional		: in  std_logic_vector(31 downto 0);
			incondicional  		: in  std_logic_vector(27 downto 0);
			sinal_branch			: in  std_logic;
			sinal_jump 				: in  std_logic;
			sinal_zero				: in 	std_logic;
			saida                : out std_logic_vector(31 downto 0)
		);
	end component;

	component somador_completo is
		port(
			a, b 		: in  std_logic;
			carry_in	: in  std_logic;
			carry_out	: out std_logic;
			saida		: out std_logic
		);
	end component;

	component registrador is
		generic( tamanho : integer := 32);
		port(
			data 	: in  std_logic_vector(tamanho - 1 downto 0);
			clock	: in  std_logic;
			clear	: in  std_logic;
			enable: in  std_logic;
			q		: out std_logic_vector(tamanho - 1 downto 0)	
		);
	end component;

	component somador is
		generic( tamanho : integer := 32);
		port(
			a, b		: in  std_logic_vector(tamanho - 1 downto 0);
			subtracao: in  std_logic;
			Ov, Cout	: out std_logic;
			saida 	: out std_logic_vector(tamanho - 1 downto 0)
		);
	end component;

	component ula is
		port(
		a, b		: in std_logic_vector(31 downto 0);
		op			: in std_logic_vector(2 downto 0);
		Zero 		: out std_logic;
		Ov, Cout	: out std_logic;
		saida 	: out std_logic_vector(31 downto 0)
	);
	end component;

	component memoria_dados is
		port(
			endereco	: in std_logic_vector (6 downto 0);
			clock		: in std_logic;
			dado		: in std_logic_vector (31 downto 0);
			rden		: in std_logic;
			wren		: in std_logic ;
			q		   : out std_logic_vector (31 downto 0)
		);
	end component;
	

	component memoria_instrucoes is
		port(
			endereco	: in std_logic_vector (6 downto 0);
			q		   : out std_logic_vector (31 downto 0)
		);
	end component;

	component banco_registradores is
		port(
			reg_ler1, reg_ler2 		: in  std_logic_vector(4 downto 0);
			reg_escrever 				: in  std_logic_vector(4 downto 0);
			dado_escrever 				: in  std_logic_vector(31 downto 0);
			dado_lido1, dado_lido2 	: out std_logic_vector(31 downto 0);

			regs_dest 	: in  std_logic;
			escr_reg 	: in  std_logic;
			clock 		: in  std_logic;
			reset 		: in  std_logic
		);

	end component;

	component controle is
		port(
			opcode : in std_logic_vector(5 downto 0);

			--- sinais gerados
			regs_dest 			: out std_logic;
			jump	      		: out std_logic;
			branch      		: out std_logic;
			ler_mem			 	: out std_logic;
			mem_para_reg 	 	: out std_logic;
			ula_op          	: out std_logic_vector(2 downto 0);
			esc_mem			 	: out std_logic;
			ula_fonte   		: out std_logic;
			escr_reg 			: out std_logic
		);
	end component;

	component gerador_operando is
		port(
			MD: in  std_logic_vector(31 downto 0);
			MR: in  std_logic_vector(2 downto 0);
			saida	: out std_logic_vector(33 downto 0)
		);
	end component;

	component multiplicador is
		port(
			operando_1, operando_2: in  std_logic_vector(31 downto 0);
			saida	: out std_logic_vector(31 downto 0)
		);
	end component;

end package;
