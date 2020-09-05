#!/bin/zsh
######################### set p oh my zshl###################
echo "setting up Oh_my_zsh"
#install
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

install theme powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc

# and the corresponding font
wget -O /Library/Fonts/font_sourcecodepro_powerline_awesomeregular.ttf https://github.com/Falkor/dotfiles/blob/master/fonts/SourceCodePro+Powerline+Awesome+Regular.ttf?raw=true

sed -i '' '/^plugins=(/  a\
 \ \ zsh-autosuggestions \
 \ \ web-search \
 \ \ jsontools \
 \ \ macports \
 \ \ node \
 \ \ osx \
 \ \ sudo \
 \ \ thor \
 \ \ docker \
' ~/.zshrc

echo " download fonts and set up terminal by running /n p10k configuration"
