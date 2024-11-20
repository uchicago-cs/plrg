{pkgs ? import <nixpkgs> {}}:
pkgs.mkShellNoCC {
  packages = [
    pkgs.multimarkdown
    pkgs.ruby
    pkgs.fswatch
    (pkgs.aspellWithDicts (d: [d.en d.en-computers]))
  ];
}
