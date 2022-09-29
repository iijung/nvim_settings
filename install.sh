#/usr/bin/env bash
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: minjungk <minjungk@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/29 15:29:02 by minjungk          #+#    #+#              #
#    Updated: 2022/09/29 15:37:31 by minjungk         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

LRED=$'\033[1;31m'
LCYAN=$'\033[1;36m'
LGREEN=$'\033[1;32m'
YEELOW=$'\033[1;33m'
W=$'\033[1;37m'
NC=$'\033[0m'

PS3='Please Select: '

# **************************************************************************** #
# Requirements
# **************************************************************************** #

# fonts 
echo 
echo "${W}install nerd fond${NC}"
select font in fira hack "go website" no
do
	case $font in
		fira)
			curl -fLO "https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip";
			unzip -d "Fira_Code_v6.2" "Fira_Code_v6.2.zip";
			open "Fira_Code_v6.2/ttf";
			open "Fira_Code_v6.2/variable_ttf";
			;;
		hack)
			curl -fLO "https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip";
			unzip -d "Hack-v3.003-ttf" "Hack-v3.003-ttf.zip";
			open "Hack-v3.003-ttf"; 
			;;
		"go website") 
			open https://www.nerdfonts.com/font-downloads;
			;;
		no)
	esac
	break;
done

# neovim
if ! which nvim > /dev/null; then
	echo
	echo "${W}install neovim${NC}"
	select yn in yes no
	do
		case $yn in
			yes)
				curl -fLO https://github.com/neovim/neovim/releases/download/stable/nvim-macos.tar.gz
				tar xzf nvim-macos.tar.gz -C $HOME
				rm -f nvim-macos.tar.gz
				echo "export $HOME/nvim-macos/bin:$PATH" >> ~/.zshrc
				source ~/.zshrc
				echo "${LGREEN}you can use nvim now${NC}"
				;;
			no) exit;;
		esac
		break;
	done
fi

[[ "$(command -v nvim)" ]] || { echo "nvim is not installed" 1>&2 ; exit 1; }

# astronvim
echo
echo "${W}install astronvim${NC}"
select yn in yes no
do
	case $yn in
		yes)
			mv ~/.config/nvim ~/.config/nvim.bak;
			mv ~/.local/share/nvim/site ~/.local/share/nvim/site.bak;
			git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim;
			nvim +PackerSync;
			echo "${LGREEN}Done :D${NC}"
			;;
		no) 
			;;
	esac
	break;
done


# **************************************************************************** #
# Optionals 
# **************************************************************************** #

# lazygit
echo
echo "${W}install lazygit${NC}"
select yn in yes no
do
	case $yn in
		yes)
			curl -fLO "https://github.com/jesseduffield/lazygit/releases/download/v0.35/lazygit_0.35_Darwin_arm64.tar.gz"
			tar xzf "lazygit_0.35_Darwin_arm64.tar.gz"
			echo "${LGREEN}Done :D${NC}"
			;;
		no) exit;;
	esac
	break;
done
