set -x PATH $PATH /home/thomas/.emacs.d/bin/ 

set theme_color_scheme gruvbox

abbr -a atmel evince ~/Cours/INF1900/atmel-datasheet.pdf

abbr -a vivado /opt/Xilinx/Vivado/2020.2/bin/vivado -mode tcl

abbr -a simulide ~/SimulIDE_0.3.12-SR8-INF1900.2/bin/simulide_ubuntu-18.04.5

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME' 

neofetch
