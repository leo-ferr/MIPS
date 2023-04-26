LIBRARY IEEE;
LIBRARY WORK;
USE WORK.UTILS.n_bits;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY registrador IS
	PORT(
		data 	: IN  STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0);
		clock	: IN  STD_LOGIC;
		clear	: IN  STD_LOGIC;
		enable	: IN  STD_LOGIC;
		q		: OUT STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0)	
	);
END registrador;

ARCHITECTURE behavior OF registrador IS

	SIGNAL s: STD_LOGIC_VECTOR(n_bits - 1 DOWNTO 0); 

BEGIN
	
	PROCESS(clock, clear, enable)
	BEGIN
		IF (clear = '1' ) THEN
			s <= (OTHERS => '0');
			
		ELSIF rising_edge(clock) AND (enable = '1') THEN
			s <= data;
			
		END IF;
	
	END PROCESS;
	
	q <= s;
	
END behavior;