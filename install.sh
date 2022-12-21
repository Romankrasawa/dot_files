#!/bin/bash
#   installing needed packages
    echo "installing packages"
    sudo pacman -S --needed alacritty neovim tmux nodejs python gcc rust ccls git rust-analyzer 
    curl -sSL https://install.python-poetry.org | python3 -

#   installing nerd-fonts
    echo "installing nerd fonts"
    mkdir -p ~/.local/share/fonts/nerd-fonts/
    cd ~/.local/share/fonts/nerd-fonts/ && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
#   installing lsp server
    echo "installing lsp server" 
    sudo npm install -g emmet-ls pyright vscode-languageserver typescript typescript-language-server rust-analyzer
#   change shell to zsh and install oh my zsh
    chsh -s $(which zsh)
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  # copy config file
    sudo rm -r ~/.config/alacritty
    sudo cp -r alacritty ~/.config/
    sudo rm -r ~/.config/nvim
    sudo cp -r nvim ~/config/
    sudo rm ~/.tmux.conf
    sudo cp .tmux.conf ~/
    sudo rm ~/.zshrc 
    sudo cp .zshrc ~/

