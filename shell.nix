{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    clang-tools
    clang

    gnumake
    bear
  ];
}
