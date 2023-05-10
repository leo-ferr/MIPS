library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity banco_registradores is
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

end banco_registradores;

architecture arq of banco_registradores is

	type memo_t is array(0 to 31) of std_logic_vector(31 downto 0);
	signal registradores : memo_t := (others => (others => '0'));

begin

	process(clock)
        variable endereco : std_logic_vector(4 downto 0);
   begin

		if reset = '1' then
			registradores <= (others => (others => '0'));

		elsif escr_reg = '1' and rising_edge(clock) then
            --- seleciona o endereco a ser escrito
			case regs_dest is
				when '1' => endereco := reg_escrever;
				when '0' => endereco := reg_ler2;
				when others => report "unreachable" severity failure;
			end case;

			case endereco is
				when "00000" => endereco := endereco;
				when others  => registradores(to_integer(unsigned(endereco))) <= dado_escrever;
				
			end case;
		end if;

		dado_lido1 <= registradores(to_integer(unsigned(reg_ler1)));
		dado_lido2 <= registradores(to_integer(unsigned(reg_ler2)));
    end process;

end arq;
