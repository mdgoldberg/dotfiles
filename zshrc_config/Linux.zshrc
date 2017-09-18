test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$PATH"
test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="$PATH:$(brew --prefix)/bin"
$(brew --prefix)/opt/fzf/install
