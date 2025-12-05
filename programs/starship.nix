{ username, ... }:
{
  enable = true;
  settings = {
    add_newline = true;
    character = {
      success_symbol = "[➜](bold green)";
      error_symbol = "[➜](bold red)";
    };
    shell = {
      disabled = false;
      format = "[$indicator $name]($style) ";
      style = "bold blue";
      bash_indicator = "";
      zsh_indicator = "⚡";
      fish_indicator = "󰈺";
      nu_indicator = "⟡";
    };
  };
}
