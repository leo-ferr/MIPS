LIBRARY IEEE;
LIBRARY WORK;
USE WORK.UTILS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ula IS
	generic ( tamanho : integer := 32);
	PORT(
		a, b		: IN STD_LOGIC_VECTOR(tamanho - 1 DOWNTO 0);
		op			: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		Zero 		: OUT STD_LOGIC;
		Ov, Cout	: OUT STD_LOGIC;
		saida 	: OUT STD_LOGIC_VECTOR(tamanho - 1 DOWNTO 0)
	);
END ula;

ARCHITECTURE behavior OF ula IS
	SIGNAL s: STD_LOGIC_VECTOR(tamanho - 1 DOWNTO 0);
	SIGNAL saida_soma, saida_multi : STD_LOGIC_VECTOR(tamanho - 1 DOWNTO 0);
	SIGNAL soma_Ov, soma_Cout : STD_LOGIC;
	
	signal sub : std_LOGIC;
BEGIN
	soma: somador PORT MAP(
					a => a,
					b => b,
					carry_in => sub,
					Ov => soma_Ov,
					Cout => soma_Cout,
					saida => saida_soma
				);

	multiplica : multiplicador 
		port map(
			operando_1 => a,
			operando_2 => b,
			saida => saida_multi
		);
	
	PROCESS(a, b, op,saida_soma)
	BEGIN
		IF (op = "000") THEN -- multiplicacao
			s <= saida_multi;
			
		ELSIF (op = "001") THEN	-- soma
			sub <= '0'; 
			s <= saida_soma;
			
		ELSIF (op = "010") THEN	-- subtracao
			sub <= '1'; 
			s <= saida_soma;
			
		END IF;
	END PROCESS;
	
	saida <= s;
	Ov <= soma_Ov;
	Cout <= soma_Cout;
	Zero <= x"00000000" = s;
	
END behavior;