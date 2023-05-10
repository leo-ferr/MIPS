library ieee;
use ieee.std_logic_1164.all;

entity controle is
	port(
		opcode : in std_logic_vector(5 downto 0);

		--- sinais gerados
		regs_dest 			: out std_logic;
		jump	      		: out std_logic;
		branch      		: out std_logic;
		ler_mem			 	: out std_logic;
		mem_para_reg 	 	: out std_logic;
		ula_op          	: out std_logic_vector(2 downto 0);
		esc_mem			 	: out std_logic;
		ula_fonte   		: out std_logic;
		escr_reg 			: out std_logic
	);
end controle;

architecture arq of controle is
	
begin

	process(opcode)
   begin
		case opcode is
			-- multiplicacao
			when "000001" => 
				regs_dest <= '1';
				jump <= '0';
				branch <= '0';
				ler_mem <= '0';
				mem_para_reg <= '0';
				ula_op <= "000";
				esc_mem <= '0';
				ula_fonte <= '0';
				escr_reg <= '1';
			
			
			-- desvio incondicional
			when "000010" =>
				regs_dest <= '0';
				jump <= '1';
				branch <= '0';
				ler_mem <= '0';
				mem_para_reg <= '0';
				ula_op <= "000";
				esc_mem <= '0';
				ula_fonte <= '0';
				escr_reg <= '0';
		  
			-- desvio condicional
			when "000011" =>
				regs_dest <= '1';
				jump  <= '0';
				branch <= '1';
				ler_mem <= '0';
				mem_para_reg <= '0';
				ula_op  <= "010";
				esc_mem <= '0';
				ula_fonte <= '0';
				escr_reg <= '0';
		  
			-- load
			when "000100" =>
				regs_dest <= '0';
				jump <= '0';
				branch <= '0';
				ler_mem <= '1';
				mem_para_reg <= '1';
				ula_op <= "001";
				esc_mem <= '0';
				ula_fonte <= '1';
				escr_reg <= '1';
		  
			-- store
			when "000101" =>
				regs_dest <= '0';
				jump <= '0';
				branch <= '0';
				ler_mem <= '0';
				mem_para_reg <= '0';
				ula_op <= "001";
				esc_mem <= '1';
				ula_fonte <= '1';
				escr_reg <= '0';
			
			-- soma
			when "000110" =>
				regs_dest <= '1';
				jump <= '0';
				branch <= '0';
				ler_mem <= '0';
				mem_para_reg <= '0';
				ula_op <= "001";
				esc_mem <= '0';
				ula_fonte <= '0';
				escr_reg <= '1';

			-- subtracao
			when "000111" =>
				regs_dest <= '1';
				jump <= '0';
				branch <= '0';
				ler_mem <= '0';
				mem_para_reg <= '0';
				ula_op <= "010";
				esc_mem <= '0';
				ula_fonte <= '0';
				escr_reg <= '1';
			-- outros casos tudo zero
			when others =>
				regs_dest <= '0';
				jump <= '0';
				branch <= '0';
				ler_mem <= '0';
				mem_para_reg <= '0';
				ula_op <= "000";
				esc_mem <= '0';
				ula_fonte <= '0';
				escr_reg <= '0';
		end case;
    end process;

end arq;
