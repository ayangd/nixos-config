{ username, pkgs, ... }:
{
  configurations = {
    enable = true;
    enableBashIntegration = true;
  };

  packages = with pkgs.ocamlPackages; [
    dune_3
    ocamlformat
    lsp
    odoc
    utop
  ];
}
