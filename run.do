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

# abre a simulação
vsim -gui work.TestBench

# adiciona os sinais
add wave -color red -label clock sim:/TestBench/clk
add wave -color yellow -label clear sim:/TestBench/clr

add wave -radix decimal -color yellow -label instrucao sim:/TestBench/DUT/instrucao

add wave -color green -radix decimal -label registrador(0) sim:/TestBench/DUT/BANCO_REGS/registradores(0)
add wave -color green -radix decimal -label registrador(1) sim:/TestBench/DUT/BANCO_REGS/registradores(1)
add wave -color green -radix decimal -label registrador(2) sim:/TestBench/DUT/BANCO_REGS/registradores(2)
add wave -color green -radix decimal -label registrador(3) sim:/TestBench/DUT/BANCO_REGS/registradores(3)
add wave -color green -radix decimal -label registrador(4) sim:/TestBench/DUT/BANCO_REGS/registradores(4)
add wave -color green -radix decimal -label registrador(5) sim:/TestBench/DUT/BANCO_REGS/registradores(5)
add wave -color green -radix decimal -label registrador(6) sim:/TestBench/DUT/BANCO_REGS/registradores(6)
add wave -color green -radix decimal -label registrador(7) sim:/TestBench/DUT/BANCO_REGS/registradores(7)
add wave -color green -radix decimal -label registrador(8) sim:/TestBench/DUT/BANCO_REGS/registradores(8)
add wave -color green -radix decimal -label registrador(9) sim:/TestBench/DUT/BANCO_REGS/registradores(9)

add wave -color cyan -radix decimal -label memoria(0) sim:/testbench/DUT/MEM2/memoria(0)
add wave -color cyan -radix decimal -label memoria(1) sim:/testbench/DUT/MEM2/memoria(1)
add wave -color cyan -radix decimal -label memoria(2) sim:/testbench/DUT/MEM2/memoria(2)
add wave -color cyan -radix decimal -label memoria(3) sim:/testbench/DUT/MEM2/memoria(3)
add wave -color cyan -radix decimal -label memoria(4) sim:/testbench/DUT/MEM2/memoria(4)
add wave -color cyan -radix decimal -label memoria(5) sim:/testbench/DUT/MEM2/memoria(5)
add wave -color cyan -radix decimal -label memoria(6) sim:/testbench/DUT/MEM2/memoria(6)
add wave -color cyan -radix decimal -label memoria(7) sim:/testbench/DUT/MEM2/memoria(7)
add wave -color cyan -radix decimal -label memoria(8) sim:/testbench/DUT/MEM2/memoria(8)
add wave -color cyan -radix decimal -label memoria(9) sim:/testbench/DUT/MEM2/memoria(9)

#add wave -radix decimal sim:/testbench/DUT/dado_escrever
#add wave -radix decimal sim:/testbench/DUT/instrucao
#add wave -radix decimal sim:/testbench/DUT/MEM1/address
#add wave -radix decimal sim:/testbench/DUT/MEM1/q
#add wave -radix decimal sim:/testbench/DUT/ULA_c/a
#add wave -radix decimal sim:/testbench/DUT/ULA_c/b
#add wave -radix decimal sim:/testbench/DUT/ULA_c/op
#add wave -radix decimal sim:/testbench/DUT/ULA_c/saida
#add wave -radix decimal sim:/testbench/DUT/ULA_c/Zero


run 10 ns

wave zoom range 0 6000

wave cursor time -time 5000 1
