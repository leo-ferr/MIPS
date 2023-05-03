library ieee;
use ieee.std_logic_1164.all;

entity controle is
	generic( tamanho : integer := 32);
	port(
		instru : in std_logic_vector(5 downto 0);

        --- sinais gerados
        regs_dest 		: out std_logic;
        desvio      		: out std_logic;
        memoria_leitura : out std_logic;
        mux_memoria 		: out std_logic;
        ula_op          : out std_logic_vector(2 downto 0);
        memoria_escrita : out std_logic;
        ula_fonte   		: out std_logic;
        escr_reg 			: out std_logic
        
	);

end controle;

architecture arq of controle is

	
begin

	process(clock)
        
    begin
        
		case instrucao is
			
			-- multiplicacao
			when "000000" => 
				regs_dest <= '1';
				desvio  <= '0';
				memoria_leitura <= '0';
				mux_memoria <= '1';
				ula_op   <= "000";
				memoria_escrita <= '0';
				ula_fonte <= '0';
				escr_reg <= '1'
			
			-- desvio incondicional
			when "000001" =>
			
				regs_dest <= '1';
				desvio  <= '0';
				memoria_leitura <= '0';
				mux_memoria <= '1';
				ula_op   <= "000";
				memoria_escrita <= '0';
				ula_fonte <= '0';
				escr_reg <= '1'
		  
		  
			-- desvio condicional
			when "000010" =>
			
				regs_dest <= '1';
				desvio  <= '0';
				memoria_leitura <= '0';
				mux_memoria <= '1';
				ula_op   <= "000";
				memoria_escrita <= '0';
				ula_fonte <= '0';
				escr_reg <= '1'
		  
		  
		  
			-- load
			when "000100" =>
				regs_dest <= '1';
				desvio  <= '0';
				memoria_leitura <= '0';
				mux_memoria <= '1';
				ula_op   <= "000";
				memoria_escrita <= '0';
				ula_fonte <= '0';
				escr_reg <= '1'
		  
		  
		  
			-- store
			when "001000" =>
				regs_dest <= '1';
				desvio  <= '0';
				memoria_leitura <= '0';
				mux_memoria <= '1';
				ula_op   <= "000";
				memoria_escrita <= '0';
				ula_fonte <= '0';
				escr_reg <= '1'
				
    end process;

end arq;