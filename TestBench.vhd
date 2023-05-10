library ieee;
use ieee.std_logic_1164.all;

entity TestBench is
end TestBench;

architecture arq of TestBench is

   signal clk : std_logic;
   signal clr : std_logic;
   -- signal instru : std_logic_vector(31 downto 0);

   component MIPS is
      port(
         clk 	: in std_logic;
         reset : in std_logic
         -- instrucao : in std_logic_vector(31 downto 0)
      );
   end component;

begin
   clr <= '1', '0' after 0.25 ns;
   
   DUT: MIPS port map(
      clk => clk,
      reset => clr
		-- instrucao => instru
   );

   clock_signal : process
   begin
      clk <= '1', '0' after 0.5 ns;
      wait for 1 ns;
   end process;

   -- main : process
   -- begin
   --    instru <= x"00000000",
   --              "00010000000000010000000000000000" after 1 ns,
   --              "00010000000000100000000000001010" after 2 ns,
   --              "00011000001000100001100000000000" after 3 ns,
   --              "00010100000000110000000000000011" after 4 ns,
   --              "00010000000001000000000000000011" after 5 ns;
   --    wait;
   -- end process;

   -- OPERAÇÕES:
   -- 000001 multiplica
   -- 000010 desvio incondicional 
   -- 000011 desvio condicional
   -- 000100 load
   -- 000101 store
   -- 000110 soma
   -- 000111 subtracao

   -- opcode + reg_src_1 + reg_src_2 + reg_dest + shamt + func
   --    6   +    5      +    5      +    5     +   5   +  6
   -- opcode + reg_base + reg_src + deslocamento (STORE, LOAD)
   --    6   +     5    +    5    +      16
   
   -- PATTERN
   -- 000000_00000_00000_00000_00000000000
   -- 000000_00000_00000_0000000000000000
   -- 000100_00000_00001_0000000000000011

   --load em reg(1) de memoria(0) 
   --00010000000000010000000000000000  -- 268500992
   
   --load em reg(2) de memoria(10)
   --00010000000000100000000000001010  -- 201457674

   --add reg(1) e reg(2) em reg(3)
   --00011000001000100001100000000000  -- 337778688

   --store de reg(3) em mem(3)
   --00010100000000110000000000000011  -- 268632067
   
   --load em reg(4) de memoria(3)
   --00010000000001000000000000000011  -- 201588739

end architecture;
