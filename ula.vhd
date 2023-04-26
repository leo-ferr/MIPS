LIBRARY IEEE;
LIBRARY WORK;
USE WORK.UTILS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ula1 IS
	PORT(
		a, b		: IN STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0);
		op			: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		Ov, Cout	: OUT STD_LOGIC;
		saida 	: OUT STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0)
	);
END ula1;

ARCHITECTURE behavior OF ula1 IS
	SIGNAL s: STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0);
	SIGNAL saida_soma : STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0);
	SIGNAL soma_Ov, soma_Cout : STD_LOGIC;
BEGIN

	soma: somador PORT MAP(
					a => a,
					b => b,
					carry_in	=> '0',
					Ov => soma_Ov,
					Cout => soma_Cout,
					saida => saida_soma
				);
	
	PROCESS(a, b, op,saida_soma)
	BEGIN
		IF (op = "00") THEN
			s <= a;
			
		ELSIF (op = "01") THEN
			s <= a OR b;
			
		ELSIF (op = "10") THEN
			s <= saida_soma;
			
		ELSIF (op = "11") THEN
			s <= a XOR (NOT b);
		
		END IF;
	END PROCESS;
	
	saida <= s;
	Ov <= soma_Ov;
	Cout <= soma_Cout;

END behavior;