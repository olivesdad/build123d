let
  pkgs = import <nixpkgs> {};
  
in pkgs.mkShell rec {
  packages = let 
    cadquery-ocp = pkgs.python3Packages.callPackage ./cadquery-ocp.nix {};
    build123d = pkgs.python3Packages.callPackage ./build123d.nix {};  
   in
   [
    (pkgs.python312.withPackages (p: with p; [
      #build123d
      cadquery-ocp
    ]))
  ];
}