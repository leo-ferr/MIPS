package utils is
	constant N_BITS : integer := 8;
	ENTITY somador_completo IS
		PORT(
			a, b 		: IN  STD_LOGIC;
			carry_in	: IN  STD_LOGIC;
			carry_out	: OUT STD_LOGIC;
			saida		: OUT STD_LOGIC
		);
	END somador_completo;

	ENTITY registrador IS
	GENERIC( width : INTEGER := 8);
		PORT(
			data 	: IN  STD_LOGIC_VECTOR(width - 1 DOWNTO 0);
			clock	: IN  STD_LOGIC;
			clear	: IN  STD_LOGIC;
			enable	: IN  STD_LOGIC;
			q		: OUT STD_LOGIC_VECTOR(width - 1 DOWNTO 0)	
		);
	END registrador;

	ENTITY somador IS
		GENERIC( width : INTEGER := 8);
		PORT(
			a, b		: IN  STD_LOGIC_VECTOR(width - 1 DOWNTO 0);
			carry_in	: IN  STD_LOGIC;
			Ov, Cout	: OUT STD_LOGIC;
			saida 		: OUT STD_LOGIC_VECTOR(width - 1 DOWNTO 0)
		);
	END somador;

	ENTITY ula1 IS
		GENERIC( width : INTEGER := 8);
		PORT(
			a, b		: IN STD_LOGIC_VECTOR(width - 1 DOWNTO 0);
			op			: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			Ov, Cout	: OUT STD_LOGIC;
			saida 		: OUT STD_LOGIC_VECTOR(width - 1 DOWNTO 0)
		);
	END ula1;

	ENTITY mux_2_1 IS
		GENERIC( width : INTEGER := 8);
		PORT(
			in_0, in_1	: IN  STD_LOGIC_VECTOR(width - 1 DOWNTO 0);
			sel 		: IN  STD_LOGIC;
			saida		: OUT STD_LOGIC_VECTOR(width - 1 DOWNTO 0)
		);
	END mux_2_1;
	
	ENTITY memoria_ram IS
		PORT
		(
			clock		: IN STD_LOGIC  := '1';
			data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			rdaddress		: IN STD_LOGIC_VECTOR (6 DOWNTO 0);
			wraddress		: IN STD_LOGIC_VECTOR (6 DOWNTO 0);
			wren		: IN STD_LOGIC  := '0';
			q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
		);
	END memoria_ram;

	entity banco_registradores is
		generic (tamanho : integer := 32)
		port(
			reg_ler1, reg_ler2 : std_logic_vector(4 downto 0);
			reg_escrever : std_logic_vector(4 downto 0);
			dado_escrever : std_logic_vector(tamanho - 1 downto 0);
			dado_lido1, dado_lido2 : std_logic_vector(tamanho - 1 downto 0);

			regs_dest : std_logic;
			escr_reg : std_logic;
			clock : std_logic;
			reset : std_logic
		);

	end banco_registradores;

	entity controle is
		port(
			instru : std_logic_vector(5 downto 0);

			--- sinais gerados
			regs_dest : std_logic;
			desvio      : std_logic;
			memoria_leitura : std_logic;
			mux_memoria : std_logic;
			ula_op          : std_logic;
			memoria_escrita : std_logic;
			ula_fonte   :std_logic;
			escr_reg : std_logic
			
		);

	end controle;

	ENTITY gerador_operando IS
		generic( tamanho : integer := 32);
		PORT(
			MD: IN  STD_LOGIC_VECTOR(tamanho - 1 DOWNTO 0);
			MR: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
			saida	: OUT STD_LOGIC_VECTOR(tamanho + 1 DOWNTO 0)
		);
	END gerador_operando;

	ENTITY multiplicador IS
		generic( tamanho : integer := 32)
		PORT(
			operando_1, operando_2: IN  STD_LOGIC_VECTOR(tamanho - 1 DOWNTO 0);
			saida	: OUT STD_LOGIC_VECTOR((2 * tamanho) - 1 DOWNTO 0)
		);
	END multiplicador;

end package;