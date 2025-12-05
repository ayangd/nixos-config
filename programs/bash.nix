{ username, ... }:
{
  enable = true;
  enableCompletion = true;

  historyControl = [ "ignoreboth" ];
  historySize = 1000;
  historyFileSize = 2000;

  shellOptions = [
    "histappend"
    "checkwinsize"
    "globstar"
  ];

  sessionVariables = {
    NVM_DIR = "$HOME/.nvm";
    NODE_OPTIONS = "--max-old-space-size=65536";
    GCC_COLORS = "error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01";
    LOCALE_ARCHIVE = "/usr/lib/locale/locale-archive";
    LC_ALL = "en_US.UTF-8";
    ERLANG_HOME = "/home/${username}/otp_src_27.2.1/bin";
    EDITOR = "vi";
    ENCORE_INSTALL = "/home/${username}/.encore";
  };

  shellAliases = {
    ls = "ls --color=auto";
    grep = "grep --color=auto";
    lg = "lazygit";
    startwork = "(cd ~/github/adn && tmux)";
    dip = "vim ~/dip";
  };

  # Profile content (login shell)
  profileExtra = ''
    # set PATH so it includes user's private bin if it exists
    if [ -d "$HOME/bin" ] ; then
      PATH="$HOME/bin:$PATH"
    fi

    # set PATH so it includes user's private bin if it exists
    if [ -d "$HOME/.local/bin" ] ; then
      PATH="$HOME/.local/bin:$PATH"
    fi

    . "/home/${username}/.deno/env"
    . "$HOME/.cargo/env"

    # opam configuration
    test -r '/home/${username}/.opam/opam-init/init.sh' && . '/home/${username}/.opam/opam-init/init.sh' > /dev/null 2> /dev/null || true
  '';

  # Bashrc content (interactive shell)
  initExtra = ''
    # set variable identifying the chroot you work in (used in the prompt below)
    if [ -z "''${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
      debian_chroot=$(cat /etc/debian_chroot)
    fi

    # set a fancy prompt (non-color, unless we know we "want" color)
    case "$TERM" in
    xterm-color | *-256color) color_prompt=yes ;;
    esac

    if [ -n "$force_color_prompt" ]; then
      if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
      else
        color_prompt=
      fi
    fi

    if [ "$color_prompt" = yes ]; then
      PS1='$\{debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    else
      PS1='$\{debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    fi
    unset color_prompt force_color_prompt

    # If this is an xterm set the title to user@host:dir
    case "$TERM" in
    xterm* | rxvt*)
      PS1="\[\e]0;''${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
      ;;
    *) ;;
    esac

    # enable color support of ls via dircolors
    if [ -x /usr/bin/dircolors ]; then
      test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    fi

    # NVM
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

    # PATH additions
    export PATH="$PATH:/opt/nvim-linux64/bin"
    export PATH="/home/${username}/.cache/rebar3/bin:$PATH"
    export PATH="/home/${username}/otp_src_27.2.1/bin:$PATH"
    export PATH="$ENCORE_INSTALL/bin:$PATH"

    # GVM
    [[ -s "/home/${username}/.gvm/scripts/gvm" ]] && source "/home/${username}/.gvm/scripts/gvm"

    # Deno and Cargo (also in interactive)
    . "/home/${username}/.deno/env"
    . "$HOME/.cargo/env"

    # Vi mode
    set -o vi

    # Carapace completions
    source <(carapace _carapace)

    # ============
    # Last Hook!!!
    # ============
    eval "$(direnv hook bash)"
    eval "$(mise activate bash)"
  '';
}
