### ----------ALIASES ---------- ###
#update
# alias upd='sudo nix-channel --update && sudo nixos-rebuild switch --upgrade'

alias upd='
  echo "📦 Recording current system state..."
  OLD_SYS=$(readlink -f /nix/var/nix/profiles/system)

  sudo nix-channel --update && sudo nixos-rebuild switch --upgrade

  echo "  Analyzing changes with nvd..."
  NEW_SYS=$(readlink -f /nix/var/nix/profiles/system)

  if [ "$OLD_SYS" = "$NEW_SYS" ]; then
    echo "󰄬 No packages were changed."
  else
    nvd diff "$OLD_SYS" "$NEW_SYS"
  fi
'

#install stuff
alias cfg='sudoedit /etc/nixos/configuration.nix'
alias nrs='sudo nixos-rebuild switch'
alias src='nh search'

alias ytd='yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --embed-metadata --convert-thumbnails jpg --ppa "ThumbnailsConvertor+ffmpeg_o:-vf crop=ih:ih" -o "%(playlist_index)03d - %(title)s.%(ext)s" --cookies-from-browser firefox'

mkcd() {
  mkdir -p "$1" && cd "$1"
}

svlink() {
    if [ -z "$1" ]; then
    echo "error: specify a service name ("svlink dbus" for example)"
    return 1
    fi
    doas ln -s "/etc/sv/$1" "/var/service/$1"
}

svunlink() {
    if [ -z "$1" ]; then
    echo "Error: specify a service name (svlink dbus for example)"
    return 1
    fi
    sudo rm "/var/service/$1"
}

alias svlist='ls /var/service'
alias svalist='ls /etc/sv'

#quick edit
alias brc='nvim ~/.bashrc'
alias sorc='source ~/.bashrc'
alias mngrc='nvim ~/.dotfiles/config/mango'
alias footrc='nvim ~/.config/foot/foot.ini'
alias music='cd ~/mp3s'
alias swy='nvim ~/.config/sway/config'
alias repopush='git push -u origin main'
alias mng='nvim ~/.config/mango'
alias walls='cd ~/wallpapers'
alias pc='ssh korou@10.0.0.85'
alias nas='ssh korou@10.0.0.231'
alias nv='nvim'

#navigate files 
alias ..='cd ..'
alias ls='lsd'
alias ll='lsd -l'
alias la='lsd -a'
alias lsla='lsd -la'
alias r='ranger'
alias y='yazi'

#MISC 
alias ff='fastfetch'
alias storage='gdu /'
alias c='clear && fastfetch'
alias mci='sudo make clean install'
alias rmpc='rmpc && mpc stop'
alias dwll='slstatus -s | dwl'
alias x='startx'
alias t='kitten theme'

#poweroff
alias po='sudo shutdown now'
alias rs='sudo reboot'



EDITOR=nvim
alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '
PS1='   \w  '
# export PS1="\\[\\e[32m\\] \\u@\\h:\\[\\e[34m\\]\\w\\[\\e[0m\\]\\$ "


# Created by `pipx` on 2026-05-20 22:55:47
export PATH="$PATH:/home/korou/.local/bin"
export MANPAGER="nvim +Man!"


#makes it so that fastfetch executes automatically if its the only terminal open on the session, otherwise itll just be blank like any other terminal 
TERMINAL_PROCESS=$(ps -o comm= $PPID)
TERMINAL_COUNT=$(pgrep -c "$TERMINAL_PROCESS")
if [ "$TERMINAL_COUNT" -eq 1 ] && command -v fastfetch >/dev/null 2>&1; then
    fastfetch
fi

# . "$HOME/.cargo/env"

### ---------- DONT TOUCH THIS, IDK IF ITLL BREAK ---------- ###
# ~/.bashrc
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#imperative stuff
#update
# alias upd='doas xbps-install -Su'

#install stuff
# alias pkgr='doas xbps-remove'
#alias src='xbps-query -Rs'
# alias pkg='doas xbps-install -S'

# pkg() {
#     if [ "$1" = "install" ]; then
# 	shift
# 	doas xbps-install "$@"
#     else
# 	echo "Unknown pkg command: $1"
#     fi

