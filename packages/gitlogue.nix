{
  config,
  pkgs,
  lib,
  ...
}:
let
  gitlogue = pkgs.rustPlatform.buildRustPackage rec {
    pname = "gitlogue";
    version = "0.3.0"; # Check the repo for the latest version

    src = pkgs.fetchFromGitHub {
      owner = "unhappychoice";
      repo = "gitlogue";
      rev = "v${version}";
      hash = "sha256-IKCjv33I6bM5PSp1IBXEArHgNF1hV9J+Zko0uV2OPZA=";
    };

    cargoHash = "sha256-j8h+EI+vOf8nN69ROFiwuUBRi84T/QdhbdMpAMupkoM=";

    # Runtime dependencies (OpenSSL is required for git2-rs)
    nativeBuildInputs = [ pkgs.pkg-config ];
    buildInputs = [
      pkgs.openssl
      pkgs.zlib
    ];

    depsBuildBuild = [ pkgs.perl ];

    # Skip checks if tests fail due to missing git repo context
    doCheck = false;

    meta = with lib; {
      description = "A terminal-based Git commit diff animator";
      homepage = "https://github.com/unhappychoice/gitlogue";
      license = licenses.isc;
      maintainers = [ ];
    };
  };
in
gitlogue
