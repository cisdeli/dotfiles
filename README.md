# My dotfiles

## Usage

Create symlinks by running:
```{bash}
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.p10k.zsh ~/.p10k.zsh
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
mkdir ~/.tmux && ln -s ~/dotfiles/.tmux/plugins ~/.tmux/plugins
ln -s ~/dotfiles/nvim .config/nvim
```

## to-Do
- [ ] Create an install script.
	* Needs:
		* oh-my-zsh.
		* zsh-autosuggestions.
		* need to install the recommended font.
		* need to install the tmux plugins or pull the original repo with this repo.
		* Telescope requires ripgrep
- [ ] Create dependencies list.
