LIBRARY ieee;
LIBRARY work;
USE work.utils.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.STD_LOGIC_SIGNED.ALL;


ENTITY gerador_operando IS
    generic( tamanho : integer := 32);
	PORT(
		MD: IN  STD_LOGIC_VECTOR(tamanho - 1 DOWNTO 0);
		MR: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		saida	: OUT STD_LOGIC_VECTOR(tamanho + 1 DOWNTO 0)
	);
END gerador_operando;

ARCHITECTURE behavior OF gerador_operando IS
	SIGNAL saida_mult: STD_LOGIC_VECTOR(tamanho + 1 DOWNTO 0);
BEGIN

	
	mult: multiplicador PORT MAP(
		MD => MD,
		negativo => MR(2),
		saida => saida_mult
	);

	PROCESS(MR, MD, saida_mult)
		VARIABLE aux : STD_LOGIC_VECTOR(8 DOWNTO 0);
	BEGIN
		IF(MR = "000" OR MR = "111") THEN
			aux := (OTHERS => '0');
			
		ELSIF(MR = "001" OR MR = "010") THEN
			aux := MD(7) & MD;
		
		ELSIF(MR = "011" OR MR = "100") THEN
			
			aux := saida_mult;
		
		ELSIF(MR = "101" OR MR = "100") THEN
			aux := MD(7) & MD;
			aux := (NOT aux) + 1;
			
			
		END IF;
		
		saida <= aux;
	END PROCESS;
	
END behavior;