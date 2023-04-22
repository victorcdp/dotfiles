sed -e "/^#/d" -e "s/#.*//" ./program_list_pacman | pacman -S --needed - &&
sed -e "/^#/d" -e "s/#.*//" ./program_list_aur | yay -S --needed - 
