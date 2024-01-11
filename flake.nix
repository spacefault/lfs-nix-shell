{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      fhs = pkgs.buildFHSUserEnv {
        name = "fhs-shell";
        targetPkgs = pkgs: [
          pkgs.gcc
          pkgs.gnumake
          pkgs.gnugrep
          pkgs.binutils
          pkgs.bash
          pkgs.bison
          pkgs.coreutils-full
          pkgs.findutils
          pkgs.diffutils
          pkgs.gawk
          pkgs.linux
          pkgs.gnum4
          pkgs.gnupatch
          pkgs.perl
          pkgs.python3
          pkgs.gnused
          pkgs.gnutar
          pkgs.texinfo
          pkgs.xz
          pkgs.util-linux
          pkgs.pciutils
        ] ;
      };
    in
      {
        devShells.${system}.default = fhs.env;
      };
}
