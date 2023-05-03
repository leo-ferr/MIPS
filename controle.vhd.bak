library ieee;
use ieee.std_logic_1164.all;


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

architecture arq of controle is

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