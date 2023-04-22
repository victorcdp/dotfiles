sudo pacman -S --needed $(awk '{print $1}' ./program_list_pacman)
yay -S --needed $(awk '{print $1}' ./program_list_aur)
