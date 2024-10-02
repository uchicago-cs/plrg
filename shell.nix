{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShellNoCC {
  packages = [ pkgs.multimarkdown pkgs.ruby pkgs.aspell pkgs.fswatch ];
}
