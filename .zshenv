_add_path() {
	if [ -z "$(eval echo \$$1)" -a -d "$HOME/$2/bin" ]; then
		eval "$1=$HOME/$2"
	fi
	if [ -d "$(eval echo \$$1)/bin" ]; then
		PATH="$(eval echo \$$1)/bin:$PATH"
	fi
}

_add_path CABAL_DIR ".cabal"
_add_path CARGO_HOME ".cargo"
_add_path GOPATH "go"
_add_path XDG_PREFIX_HOME ".local"
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}
