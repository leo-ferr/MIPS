library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity somador_completo is
	port(
		a, b 		: in  std_logic;
		carry_in	: in  std_logic;
		carry_out: out std_logic;
		saida		: out std_logic
	);
end somador_completo;

architecture behavior of somador_completo is
begin
	
	saida <= carry_in xor a xor b;
	carry_out <= (a and b) or (a and carry_in) or (b and carry_in);
	
end behavior;
