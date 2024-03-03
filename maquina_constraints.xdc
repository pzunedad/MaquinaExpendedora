# Asignación de pines físicos (ajustar según tu hardware)
set_property PACKAGE_PIN Pxx [get_ports coin_in[0]]
set_property PACKAGE_PIN Pyy [get_ports coin_in[1]]
set_property PACKAGE_PIN Pzz [get_ports coin_in[2]]
set_property PACKAGE_PIN Paa [get_ports clock]
set_property PACKAGE_PIN Pbb [get_ports reset]

# Restricciones de temporización (ajustar según requerimientos)
create_clock -period 10 [get_ports clock]

# Restricciones de entrada/salida estándar (ajustar según tu hardware)
set_property IOSTANDARD LVCMOS33 [get_ports coin_in[0]]
set_property IOSTANDARD LVCMOS33 [get_ports coin_in[1]]
set_property IOSTANDARD LVCMOS33 [get_ports coin_in[2]]
set_property IOSTANDARD LVCMOS33 [get_ports clock]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

# Otras restricciones específicas según tu diseño y plataforma
# ...

# Restricciones de ruta de reloj para evitar informes de "Unconstrained Paths"
set_clock_groups -asynchronous -group [get_ports clock] -group [get_ports reset]

# Restricciones de área para mejorar el rendimiento de la síntesis
set_property SEVERITY {Warning} [get_drc_checks REQP-51]

# Restricciones de rutas específicas si es necesario
# ...

# Restricciones para el botón de reset (ajustar según requerimientos)
set_property PACKAGE_PIN Pww [get_ports reset]

