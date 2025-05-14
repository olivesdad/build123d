let
  pkgs = import <nixpkgs> {};
  
in pkgs.mkShell rec {
  packages = let 
   cp = pkgs.python3Packages.callPackage;
   # cadquery-ocp = pkgs.python3Packages.callPackage ./cadquery-ocp.nix {};
    build123d = pkgs.python3Packages.callPackage ./build123d.nix {
      trianglesolver = cp ./trianglesolver.nix {};
      py-lib3mf = cp ./py-lib3mf.nix {};
      cadquery-ocp = cp ./cadquery-ocp.nix {};
      };  
   in
   [
    (pkgs.python312.withPackages (p: with p; [
      build123d
    ]))
  ];
}