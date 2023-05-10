library ieee;
library work;
use work.utils.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ula is
	port(
		a, b		: in std_logic_vector(31 downto 0);
		op			: in std_logic_vector(2 downto 0);
		Zero 		: out std_logic;
		Ov, Cout	: out std_logic;
		saida 	: out std_logic_vector(31 downto 0)
	);
end ula;

architecture behavior of ula is
	signal s: std_logic_vector(31 downto 0);
	signal saida_soma, saida_multi : std_logic_vector(31 downto 0);
	signal soma_Ov, soma_Cout : std_logic;
	
	signal subtracao : std_logic;

begin
	soma: somador 
		port map(
			a => a,
			b => b,
			subtracao => subtracao,
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
	
	process(a, b, op, saida_soma, saida_multi)
	begin
		case op is
		when "000" => -- multiplicacao
			s <= saida_multi;
			
		when "001" | "010" => -- soma
			-- se op = "001" fazemos a soma dos valores, se op = "010" fazemos a subtração
			-- portanto podemos colocar o op(1) como indicador de qual operação será realizada.
			subtracao <= op(1);
			s <= saida_soma;
		
		when others =>
			subtracao <= '0';
			s <= (others => '0');
		end case;
	end process;
	
	saida <= s;
	Ov <= soma_Ov;
	Cout <= soma_Cout;
	-- x"0000000000000000" = zero em hexa 64bits
	Zero <= '1' when s = x"0000000000000000" else '0';	
	
end behavior;
