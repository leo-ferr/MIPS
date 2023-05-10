LIBRARY ieee;
LIBRARY work;
USE work.utils.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.STD_LOGIC_SIGNED.ALL;


ENTITY gerador_operando IS
	PORT(
		MD: IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		MR: IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		saida	: OUT STD_LOGIC_VECTOR(33 DOWNTO 0)

	);
END gerador_operando;

ARCHITECTURE behavior OF gerador_operando IS
BEGIN
	PROCESS(MR, MD)
		VARIABLE aux : STD_LOGIC_VECTOR(33 DOWNTO 0);
	BEGIN
		IF(MR = "000" OR MR = "111") THEN
			aux := (OTHERS => '0');
			
		ELSIF(MR = "001" OR MR = "010") THEN
			aux := MD(31) & MD(31) & MD; -- EXTENDE O SINAL 
		
		ELSIF(MR = "011" OR MR = "100") THEN
			-- USAR O BIT MAIS SIGNIFICATIVO PARA INDICAR O NEGATIVO (-2 * operando)
			aux := MD(31) & MD(31) & MD; -- EXTENDE O SINAL 

			if MR(2) = '1' then
				aux := (NOT aux) + 1;	-- COMPLEMENTO DE 2
			
			end if;

			aux := aux(32 downto 0) & '0';
		
		ELSIF(MR = "101" OR MR = "110") THEN
			aux := MD(31) & MD(31) & MD; -- EXTENDE O SINAL 
			aux := (NOT aux) + 1;	-- COMPLEMENTO DE 2

		END IF;
		
		saida <= aux;
	END PROCESS;
	
END behavior;
