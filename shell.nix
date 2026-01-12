{pkgs ? import <nixpkgs> {}}:
pkgs.mkShellNoCC {
  packages = [
    pkgs.multimarkdown
    pkgs.ruby
    pkgs.fswatch
    pkgs.python3
    (pkgs.aspellWithDicts (d: [d.en d.en-computers]))
  ];
}
