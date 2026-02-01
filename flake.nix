{
  description = "Ondřej Kvapil's CV";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

      imports = [ inputs.treefmt-nix.flakeModule ];

      perSystem = { config, pkgs, ... }: {
        treefmt.config = {
          projectRootFile = "flake.nix";
          programs.nixpkgs-fmt.enable = true;
          programs.prettier.enable = true;
        };

        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            config.treefmt.build.wrapper
            just
            lychee
            rendercv
            xdg-utils
          ];
        };
      };
    };
}
