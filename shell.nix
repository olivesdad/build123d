{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.11") {} }:


pkgs.mkShellNoCC rec {
  packages = with pkgs; [
    (python3.withPackages (ps: [ 
	ps.zlib-ng
	]))
    stdenv.cc.cc.lib
    gcc
    expat
    libGL
    xorg.libX11
    xorg.libXrender
    zlib
  ];
  LD_LIBRARY_PATH=pkgs.lib.makeLibraryPath packages;
}

