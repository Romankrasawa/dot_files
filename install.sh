#!/bin/bash
#   installing needed packages
    directory=$(pwd)
    echo $directory
    echo "installing packages"
    sudo pacman -S --needed alacritty neovim tmux nodejs python gcc rust ccls git rust-analyzer npm zsh 
    curl -sSL https://install.python-poetry.org | python3 -

#   installing nerd-fonts
    echo "installing nerd fonts"
    mkdir -p ~/.local/share/fonts/nerd-fonts/
    cd ~/.local/share/fonts/nerd-fonts/ && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
#   installing lsp server
    echo "installing lsp server" 
    sudo npm install -g emmet-ls pyright vscode-languageserver typescript typescript-language-server
#   change shell to zsh and install oh my zsh
    chsh -s $(which zsh)
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  # copy config file
    cd $directory
    sudo mv alacritty ~/.config/alacritty

    sudo mv nvim ~/.config/nvim

    sudo mv .tmux.conf ~/.tmux.conf
 
    sudo mv .zshrc ~/.zshrc
  # update packages in nvim
    nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

