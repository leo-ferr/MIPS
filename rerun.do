vcom -work work -2002 -explicit ./utils.vhd
vcom -work work -2002 -explicit ./TestBench.vhd
vcom -work work -2002 -explicit ./MIPS.vhd
vcom -work work -2002 -explicit ./ula.vhd
vcom -work work -2002 -explicit ./memoria_dados.vhd
vcom -work work -2002 -explicit ./memoria_instrucoes.vhd
vcom -work work -2002 -explicit ./calcula_endereco.vhd
vcom -work work -2002 -explicit ./controle.vhd
vcom -work work -2002 -explicit ./banco_registradores.vhd
vcom -work work -2002 -explicit ./gera_operando.vhd
vcom -work work -2002 -explicit ./multiplicador.vhd
vcom -work work -2002 -explicit ./registrador.vhd
vcom -work work -2002 -explicit ./somador.vhd
vcom -work work -2002 -explicit ./somador_completo.vhd

restart -f -nolist

run 10 ns

wave zoom range 0 6000

wave cursor time -time 5000 1
