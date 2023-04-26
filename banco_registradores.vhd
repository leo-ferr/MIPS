library ieee;
use ieee.std_logic_1164.all;


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

architecture arq of banco_registradores is

    type memo_t is array(0 to 31) of std_logic_vector(tamanho - 1 downto 0);
    signal banco : memo_t := (others => others => '0');

begin

	process(clock)
        variable endereco : std_logic_vector(4 downto 0);
    begin
        
        if(escr_reg = '1' and rising_edge(clock)) then
            --- seleciona o endereco a ser escrito
            endereco := reg_escrever when regs_dest = '1' else
                        reg_ler2     when regs_dest = '0';

            banco(integer(endereco)) <= dado_escrever;

        end if;

        dado_lido1 <= banco(integer(reg_ler1));
        dado_lido2 <= banco(integer(reg_ler2));
    end process;

end arq;