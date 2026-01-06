all: setup

.PHONY: update setup sym_echo nvim nvim_unlink vim vim_unlink tmux tmux_unlink ghostty ghostty_unlink fish fish_unlink
setup: update sym_echo nvim vim tmux ghostty fish
unlink: nvim_unlink vim_unlink tmux_unlink ghostty_unlink fish_unlink
	
update:
	@echo 'Pulling latest version.'
	@git pull

sym_echo:
	@echo 'Setting up symlinks.'


# Setup
nvim:
	@mkdir -p $(HOME)/.config/
	@if [ -L $(HOME)/.config/nvim ]; then \
		echo '[Nvim] Already setup.'; \
	else \
		if [ -d $(HOME)/.config/nvim ]; then \
			mv $(HOME)/.config/nvim $(HOME)/.config/nvim_bak; \
			echo '[Nvim] Existing config moved to ~/.config/nvim_bak.'; \
		fi; \
		ln -s $(shell pwd)/nvim $(HOME)/.config/nvim; \
		echo '[Nvim] Done.'; \
	fi
	
vim:
	@if [ -L $(HOME)/.vimrc ]; then \
		echo '[Vim] Already setup.'; \
	else \
		if [ -e $(HOME)/.vimrc ]; then \
			mv $(HOME)/.vimrc $(HOME)/.vimrc.bak; \
			echo '[Vim] Existing config moved to ~/.vimrc.bak,'; \
		fi; \
		ln -s $(shell pwd)/vim/dot_vimrc $(HOME)/.vimrc; \
		echo '[Vim] Done.'; \
	fi


tmux:
	@if [ -L $(HOME)/.tmux.conf ]; then \
		echo '[Tmux] Already setup.'; \
	else \
		if [ -e $(HOME)/.tmux.conf ]; then \
			mv $(HOME)/.tmux.conf $(HOME)/.tmux.conf.bak; \
			echo '[Tmux] Existing config moved to ~/.tmux.conf.bak,'; \
		fi; \
		ln -s $(shell pwd)/tmux/dot_tmux.conf $(HOME)/.tmux.conf; \
		echo '[Tmux] Done.'; \
	fi

ghostty:
	@mkdir -p $(HOME)/.config/
	@if [ -L $(HOME)/.config/ghostty ]; then \
		echo '[Ghostty] Already setup.'; \
	else \
		if [ -d $(HOME)/.config/ghostty ]; then \
			mv $(HOME)/.config/ghostty $(HOME)/.config/ghostty_bak; \
			echo '[Ghostty] Existing config moved to ~/.config/ghostty_bak.'; \
		fi; \
		ln -s $(shell pwd)/ghostty $(HOME)/.config/ghostty; \
		echo '[Ghostty] Done.'; \
	fi

fish:
	@mkdir -p $(HOME)/.config/
	@if [ -L $(HOME)/.config/fish ]; then \
		echo '[Fish] Already setup.'; \
	else \
		if [ -d $(HOME)/.config/fish ]; then \
			mv $(HOME)/.config/fish $(HOME)/.config/fish_bak; \
			echo '[Fish] Existing config moved to ~/.config/fish_bak.'; \
		fi; \
		ln -s $(shell pwd)/fish $(HOME)/.config/fish; \
		echo '[Fish] Done. Set to default shell with "chsh -s $(which fish)"'; \
	fi


# Unlink
nvim_unlink:
	@if [ -L $(HOME)/.config/nvim ]; then \
		rm $(HOME)/.config/nvim; \
		echo '[Nvim] Unlinked.'; \
	else \
		echo '[Nvim] Not linked.'; \
	fi
	
vim_unlink:
	@if [ -L $(HOME)/.vimrc ]; then \
		rm $(HOME)/.vimrc; \
		echo '[Vim] Unlinked.'; \
	else \
		echo '[Vim] Not linked.'; \
	fi

tmux_unlink:
	@if [ -L $(HOME)/.tmux.conf ]; then \
		rm $(HOME)/.tmux.conf; \
		echo '[Tmux] Unlinked.'; \
	else \
		echo '[Tmux] Not linked.'; \
	fi

ghostty_unlink:
	@if [ -L $(HOME)/.config/ghostty ]; then \
		rm $(HOME)/.config/ghostty; \
		echo '[Ghostty] Unlinked.'; \
	else \
		echo '[Ghostty] Not linked.'; \
	fi

fish_unlink:
	@if [ -L $(HOME)/.config/fish ]; then \
		rm $(HOME)/.config/fish; \
		echo '[Fish] Unlinked.'; \
	else \
		echo '[Fish] Not linked.'; \
	fi

