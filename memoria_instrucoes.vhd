-- OPERAÇÕES:
-- 000001 multiplica
-- 000010 desvio incondicional 
-- 000011 desvio condicional
-- 000100 load
-- 000101 store
-- 000110 soma
-- 000111 subtracao

-- PATTERN
-- opcode + reg_src_1 + reg_src_2 + reg_dest + shamt + func -- tipo R
--    6   +    5      +    5      +    5     +   5   +  6   -- tipo lw/sw/jump/branch
-- opcode + reg_base + reg_src + deslocamento
--    6   +     5    +    5    +      16

-- 000000_00000_00000_00000_00000000000 -- tipo R
-- 000000_00000_00000_0000000000000000	 -- tipo lw/sw/jump/branch
-- 000011_00011_00100_1111111111111001

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoria_instrucoes is
		port(
			endereco	: in std_logic_vector (6 downto 0);
			q		   : out std_logic_vector (31 downto 0)
		);
end memoria_instrucoes;

architecture comportamento of memoria_instrucoes is

   type memo_t is array(0 to 128) of std_logic_vector(31 downto 0);
   signal memoria : memo_t := (

						-- 1 => "00010000001001000000000000000010",
					0 => "00010000000000010000000000000000", -- load de memoria(0) em reg(1) 
					1 => "00010000000000100000000000000001", -- load de memoria(1) em reg(2)
					2 => "00011000001000100001100000000000", -- add reg(1) e reg(2) em reg(3)
					3 => "00010100000000110000000000000000", -- store de reg(3) em memoria(0)
					4 => "00010000001001001111111111111101", -- load em reg(4) de memoria(5)
					5 => "00001000000000000000000000001000", -- jump 7
					6 => "00010000000001010000000000000101", -- load em reg(5) de memoria(5) 
					7 => "00000100100000010011000000000000", -- multi reg(5) e reg(1) em reg(6)
					8 => "00001100011001001111111111110111", -- beq reg(3) e reg(4) vai para instru(0)
					others => (others => '0'));

begin

   q <= memoria(to_integer(unsigned(endereco)));

end comportamento;
