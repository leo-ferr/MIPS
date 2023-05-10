library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoria_dados is
   port(
      endereco	: in std_logic_vector (6 downto 0);
      clock		: in std_logic;
      dado		: in std_logic_vector (31 downto 0);
      rden		: in std_logic;
      wren		: in std_logic ;
      q		   : out std_logic_vector (31 downto 0)
   );
end memoria_dados;

architecture comportamento of memoria_dados is

   type memo_t is array(0 to 128) of std_logic_vector(31 downto 0);
   signal memoria : memo_t  := (
      --     hex 32 bits    decimal
      0 => x"00000003",    -- 3
      1 => x"00000033",    -- 51
      2 => x"00000007",    -- 7 
      3 => x"0000001d",    -- 29
      4 => x"0000003b",    -- 59
      5 => x"00000056",    -- 86 
      others => (others => '0') 
   );

begin

   process(clock, endereco)
   begin
      if rden = '1' then
         q <= memoria(to_integer(unsigned(endereco)));

      elsif wren = '1' and rising_edge(clock) then
         memoria(to_integer(unsigned(endereco))) <= dado;

      end if;

   end process;

end comportamento;
