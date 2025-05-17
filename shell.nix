let
   pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.11") {};
  
in pkgs.mkShell rec {
  packages = let 
   cp = pkgs.python3Packages.callPackage;
   # cadquery-ocp = pkgs.python3Packages.callPackage ./cadquery-ocp.nix {};
    build123d = pkgs.python3Packages.callPackage ./build123d.nix {
      trianglesolver = cp ./trianglesolver.nix {};
      py-lib3mf = cp ./py-lib3mf.nix {};
      ocpsvg = cp ./ocpsvg.nix {
        setuptools_scm = cp ./setuptools_scm.nix {
            cadquery-ocp = cp ./cadquery-ocp.nix {};

          };
          svgelements = cp ./svgelements.nix {};
        };
      svgpathtools = cp ./svgpathtools.nix {};
      ezdxf = cp ./ezdxf.nix {};
      };  
   in
   [
    (pkgs.python3.withPackages (p: with p; [
      build123d
      vtk
    ]))
    pkgs.stdenv.cc.cc.lib
    pkgs.gcc
    pkgs.expat
    pkgs.libGL
    pkgs.xorg.libX11
    pkgs.xorg.libXrender
    pkgs.zlib
  ];
   LD_LIBRARY_PATH=pkgs.lib.makeLibraryPath packages;
}