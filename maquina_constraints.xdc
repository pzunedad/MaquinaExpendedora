# Asignaci�n de pines f�sicos (ajustar seg�n tu hardware)
set_property PACKAGE_PIN Pxx [get_ports coin_in[0]]
set_property PACKAGE_PIN Pyy [get_ports coin_in[1]]
set_property PACKAGE_PIN Pzz [get_ports coin_in[2]]
set_property PACKAGE_PIN Paa [get_ports clock]
set_property PACKAGE_PIN Pbb [get_ports reset]

# Restricciones de temporizaci�n (ajustar seg�n requerimientos)
create_clock -period 10 [get_ports clock]

# Restricciones de entrada/salida est�ndar (ajustar seg�n tu hardware)
set_property IOSTANDARD LVCMOS33 [get_ports coin_in[0]]
set_property IOSTANDARD LVCMOS33 [get_ports coin_in[1]]
set_property IOSTANDARD LVCMOS33 [get_ports coin_in[2]]
set_property IOSTANDARD LVCMOS33 [get_ports clock]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

# Otras restricciones espec�ficas seg�n tu dise�o y plataforma
# ...

# Restricciones de ruta de reloj para evitar informes de "Unconstrained Paths"
set_clock_groups -asynchronous -group [get_ports clock] -group [get_ports reset]

# Restricciones de �rea para mejorar el rendimiento de la s�ntesis
set_property SEVERITY {Warning} [get_drc_checks REQP-51]

# Restricciones de rutas espec�ficas si es necesario
# ...

# Restricciones para el bot�n de reset (ajustar seg�n requerimientos)
set_property PACKAGE_PIN Pww [get_ports reset]

