library ieee;
library work;
use work.utils.all;
use ieee.std_logic_1164.all;

ENTITY multiplicador IS
	PORT(
		operando_1, operando_2: IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		saida	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END multiplicador;

ARCHITECTURE behavior OF multiplicador IS
	SIGNAL op_2 : STD_LOGIC_VECTOR(32 DOWNTO 0); -- operando com o bit damy
	
	SIGNAL saida_gera_operando1, saida_gera_operando2:   STD_LOGIC_VECTOR(33 DOWNTO 0);
	SIGNAL saida_gera_operando3, saida_gera_operando4:   STD_LOGIC_VECTOR(33 DOWNTO 0);
	SIGNAL saida_gera_operando5, saida_gera_operando6:   STD_LOGIC_VECTOR(33 DOWNTO 0);
	SIGNAL saida_gera_operando7, saida_gera_operando8:   STD_LOGIC_VECTOR(33 DOWNTO 0);
	SIGNAL saida_gera_operando9, saida_gera_operando10:  STD_LOGIC_VECTOR(33 DOWNTO 0);
	SIGNAL saida_gera_operando11, saida_gera_operando12: STD_LOGIC_VECTOR(33 DOWNTO 0);
	SIGNAL saida_gera_operando13, saida_gera_operando14: STD_LOGIC_VECTOR(33 DOWNTO 0);
	SIGNAL saida_gera_operando15, saida_gera_operando16: STD_LOGIC_VECTOR(33 DOWNTO 0);
	
	SIGNAL saida_soma_1, saida_soma_2, saida_soma_3:    STD_LOGIC_VECTOR(33 DOWNTO 0);
	SIGNAL saida_soma_4, saida_soma_5, saida_soma_6:    STD_LOGIC_VECTOR(33 DOWNTO 0);
	SIGNAL saida_soma_7, saida_soma_8, saida_soma_9:    STD_LOGIC_VECTOR(33 DOWNTO 0);
	SIGNAL saida_soma_10, saida_soma_11, saida_soma_12: STD_LOGIC_VECTOR(33 DOWNTO 0);
	SIGNAL saida_soma_13, saida_soma_14, saida_soma_15: STD_LOGIC_VECTOR(33 DOWNTO 0);


	SIGNAL entrada_correta_somador0 : STD_LOGIC_VECTOR(33 DOWNTO 0); -- usadas para simular no modelsim
	SIGNAL entrada_correta_somador1, entrada_correta_somador2, entrada_correta_somador3 : STD_LOGIC_VECTOR(33 DOWNTO 0); -- usadas para simular no modelsim
	SIGNAL entrada_correta_somador4, entrada_correta_somador5, entrada_correta_somador6 : STD_LOGIC_VECTOR(33 DOWNTO 0); -- usadas para simular no modelsim
	SIGNAL entrada_correta_somador7, entrada_correta_somador8, entrada_correta_somador9 : STD_LOGIC_VECTOR(33 DOWNTO 0); -- usadas para simular no modelsim
	SIGNAL entrada_correta_somador10, entrada_correta_somador11, entrada_correta_somador12 : STD_LOGIC_VECTOR(33 DOWNTO 0); -- usadas para simular no modelsim
	SIGNAL entrada_correta_somador13, entrada_correta_somador14, entrada_correta_somador15 : STD_LOGIC_VECTOR(33 DOWNTO 0); -- usadas para simular no modelsim
BEGIN
	
	op_2 <= operando_2 & '0';
	
	entrada_correta_somador0 <= saida_gera_operando1(33) & saida_gera_operando1(33) & saida_gera_operando1(33 DOWNTO 2);
	entrada_correta_somador1  <= saida_soma_1(33)  & saida_soma_1(33)  & saida_soma_1(33 DOWNTO 2);
	entrada_correta_somador2  <= saida_soma_2(33)  & saida_soma_2(33)  & saida_soma_2(33 DOWNTO 2);
	entrada_correta_somador3  <= saida_soma_3(33)  & saida_soma_3(33)  & saida_soma_3(33 DOWNTO 2);
	entrada_correta_somador4  <= saida_soma_4(33)  & saida_soma_4(33)  & saida_soma_4(33 DOWNTO 2);
	entrada_correta_somador5  <= saida_soma_5(33)  & saida_soma_5(33)  & saida_soma_5(33 DOWNTO 2);
	entrada_correta_somador6  <= saida_soma_6(33)  & saida_soma_6(33)  & saida_soma_6(33 DOWNTO 2);
	entrada_correta_somador7  <= saida_soma_7(33)  & saida_soma_7(33)  & saida_soma_7(33 DOWNTO 2);
	entrada_correta_somador8  <= saida_soma_8(33)  & saida_soma_8(33)  & saida_soma_8(33 DOWNTO 2);
	entrada_correta_somador9  <= saida_soma_9(33)  & saida_soma_9(33)  & saida_soma_9(33 DOWNTO 2);
	entrada_correta_somador10 <= saida_soma_10(33) & saida_soma_10(33) & saida_soma_10(33 DOWNTO 2);
	entrada_correta_somador11 <= saida_soma_11(33) & saida_soma_11(33) & saida_soma_11(33 DOWNTO 2);
	entrada_correta_somador12 <= saida_soma_12(33) & saida_soma_12(33) & saida_soma_12(33 DOWNTO 2);
	entrada_correta_somador13 <= saida_soma_13(33) & saida_soma_13(33) & saida_soma_13(33 DOWNTO 2);
	entrada_correta_somador14 <= saida_soma_14(33) & saida_soma_14(33) & saida_soma_14(33 DOWNTO 2);
	entrada_correta_somador15 <= saida_soma_15(33) & saida_soma_15(33) & saida_soma_15(33 DOWNTO 2);

	
	saida <= saida_soma_15(1 downto 0) & saida_soma_14(1 downto 0) & saida_soma_13(1 downto 0) & saida_soma_12(1 downto 0) & 
				saida_soma_11(1 downto 0) & saida_soma_10(1 downto 0) & saida_soma_9 (1 downto 0) & saida_soma_8(1 downto 0) & 
				saida_soma_7 (1 downto 0) & saida_soma_6 (1 downto 0) & saida_soma_5 (1 downto 0) & saida_soma_4(1 downto 0) & 
				saida_soma_3 (1 downto 0) & saida_soma_2 (1 downto 0) & saida_soma_1 (1 downto 0) & saida_gera_operando1(1 downto 0);
	
	gera_operando1: gerador_operando PORT MAP(
						MD => operando_1,
						MR => op_2(2 DOWNTO 0),
						saida => saida_gera_operando1
						);
	gera_operando2: gerador_operando PORT MAP(
						MD => operando_1,
						MR => op_2(4 DOWNTO 2),
						saida => saida_gera_operando2
						);

	soma: somador
		generic map(tamanho => 34)
		port map(
            a => entrada_correta_somador0,
            b => saida_gera_operando2,
            subtracao => '0',
            Ov => open,
            Cout => open,
            saida => saida_soma_1
         );
						
	gera_operando3: gerador_operando PORT MAP(
						MD => operando_1,
						MR => op_2(6 DOWNTO 4),
						saida => saida_gera_operando3
						);
	soma2: somador 
		generic map( tamanho => 34)		
		port map(
							a => entrada_correta_somador1,
							b => saida_gera_operando3,
							subtracao => '0',
							Ov => open,
							Cout => open,
							saida => saida_soma_2
						);
						
	gera_operando4: gerador_operando PORT MAP(
						MD => operando_1,
						MR => op_2(8 DOWNTO 6),
						saida => saida_gera_operando4
						);
	soma3: somador 
		generic map( tamanho => 34)		
		port map(
							a => entrada_correta_somador2,
							b => saida_gera_operando4,
							subtracao => '0',
							Ov => open,
							Cout => open,
							saida => saida_soma_3
						);

	gera_operando5: gerador_operando PORT MAP(
						MD => operando_1,
						MR => op_2(10 DOWNTO 8),
						saida => saida_gera_operando5
						);

	soma4: somador 
		generic map( tamanho => 34)		
		port map(
						a => entrada_correta_somador3,
						b => saida_gera_operando5,
						subtracao => '0',
						Ov => open,
						Cout => open,
						saida => saida_soma_4
					);
	gera_operando6: gerador_operando PORT MAP(
						MD => operando_1,
						MR => op_2(12 DOWNTO 10),
						saida => saida_gera_operando6
						);

	soma5: somador 
		generic map( tamanho => 34)		
		port map(
						a => entrada_correta_somador4,
						b => saida_gera_operando6,
						subtracao => '0',
						Ov => open,
						Cout => open,
						saida => saida_soma_5
					);

	gera_operando7: gerador_operando PORT MAP(
						MD => operando_1,
						MR => op_2(14 DOWNTO 12),
						saida => saida_gera_operando7
						);

	soma6: somador 
		generic map( tamanho => 34)		
		port map(
						a => entrada_correta_somador5,
						b => saida_gera_operando7,
						subtracao => '0',
						Ov => open,
						Cout => open,
						saida => saida_soma_6
					);
	gera_operando8: gerador_operando PORT MAP(
						MD => operando_1,
						MR => op_2(16 DOWNTO 14),
						saida => saida_gera_operando8
						);

	soma7: somador 
		generic map( tamanho => 34)		
		port map(
						a => entrada_correta_somador6,
						b => saida_gera_operando8,
						subtracao => '0',
						Ov => open,
						Cout => open,
						saida => saida_soma_7
					);
	gera_operando9: gerador_operando PORT MAP(
						MD => operando_1,
						MR => op_2(18 DOWNTO 16),
						saida => saida_gera_operando9
						);

	soma8: somador 
		generic map( tamanho => 34)		
		port map(
						a => entrada_correta_somador7,
						b => saida_gera_operando9,
						subtracao => '0',
						Ov => open,
						Cout => open,
						saida => saida_soma_8
					);
	gera_operando10: gerador_operando PORT MAP(
						MD => operando_1,
						MR => op_2(20 DOWNTO 18),
						saida => saida_gera_operando10
						);

	soma9: somador 
		generic map( tamanho => 34)		
		port map(
						a => entrada_correta_somador8,
						b => saida_gera_operando10,
						subtracao => '0',
						Ov => open,
						Cout => open,
						saida => saida_soma_9
					);
	gera_operando11: gerador_operando PORT MAP(
						MD => operando_1,
						MR => op_2(22 DOWNTO 20),
						saida => saida_gera_operando11
						);

	soma10: somador 
		generic map( tamanho => 34)		
		port map(
						a => entrada_correta_somador9,
						b => saida_gera_operando11,
						subtracao => '0',
						Ov => open,
						Cout => open,
						saida => saida_soma_10
					);
	gera_operando12: gerador_operando PORT MAP(
						MD => operando_1,
						MR => op_2(24 DOWNTO 22),
						saida => saida_gera_operando12
						);

	soma11: somador 
		generic map( tamanho => 34)		
		port map(
						a => entrada_correta_somador10,
						b => saida_gera_operando12,
						subtracao => '0',
						Ov => open,
						Cout => open,
						saida => saida_soma_11
					);
	gera_operando13: gerador_operando PORT MAP(
						MD => operando_1,
						MR => op_2(26 DOWNTO 24),
						saida => saida_gera_operando13
						);

	soma12: somador 
		generic map( tamanho => 34)		
		port map(
						a => entrada_correta_somador11,
						b => saida_gera_operando13,
						subtracao => '0',
						Ov => open,
						Cout => open,
						saida => saida_soma_12
					);
	gera_operando14: gerador_operando PORT MAP(
						MD => operando_1,
						MR => op_2(28 DOWNTO 26),
						saida => saida_gera_operando14
						);

	soma13: somador 
		generic map( tamanho => 34)		
		port map(
						a => entrada_correta_somador12,
						b => saida_gera_operando14,
						subtracao => '0',
						Ov => open,
						Cout => open,
						saida => saida_soma_13
					);
	gera_operando15: gerador_operando PORT MAP(
						MD => operando_1,
						MR => op_2(30 DOWNTO 28),
						saida => saida_gera_operando15
						);

	soma14: somador 
		generic map( tamanho => 34)		
		port map(
						a => entrada_correta_somador13,
						b => saida_gera_operando15,
						subtracao => '0',
						Ov => open,
						Cout => open,
						saida => saida_soma_14
					);
	gera_operando16: gerador_operando PORT MAP(
						MD => operando_1,
						MR => op_2(32 DOWNTO 30),
						saida => saida_gera_operando16
						);

	soma15: somador 
		generic map( tamanho => 34)		
		port map(
						a => entrada_correta_somador14,
						b => saida_gera_operando16,
						subtracao => '0',
						Ov => open,
						Cout => open,
						saida => saida_soma_15
					);
	
END behavior;
