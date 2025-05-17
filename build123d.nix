{
  lib,
  pkgs,
  stdenv,
  buildPythonPackage,
  certifi,
  chardet,
  charset-normalizer,
  fetchPypi,
  idna,
  gcc,
  expat,
  libGL,
  xorg,
  zlib,
  pysocks,
  pytest-mock,
  pytest-xdist,
  pytestCheckHook,
  pythonOlder,
  urllib3,
  setuptools,
  setuptools_scm,
  #python things
  ipython,
  numpy_2,
  anytree,
  ezdxf,
  # stuff
 # cadquery-ocp,
  trianglesolver,
  py-lib3mf,
  ocpsvg,
  svgpathtools,
}:

buildPythonPackage rec {
  pname = "build123d";
  version = "0.9.1";
  format = "pyproject";

  disabled = pythonOlder "3.7";

  __darwinAllowLocalNetworking = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-i8F5y2XH5zkxka1xE/E3gfq/dYkr4HBg8r6/lTacCTs=";
  };

  patches = [
  ];
  #poop = pkgs.python3Packages.callPackage ./trianglesolver.nix {};

  
  dependencies = [
    stdenv.cc.cc.lib
    gcc
    expat
    libGL
    xorg.libX11
    xorg.libXrender
    setuptools
    setuptools_scm
    zlib
    numpy_2
    ipython
    ezdxf
    anytree
   # cadquery-ocp
    trianglesolver
    py-lib3mf
    ocpsvg
    svgpathtools
  ];

  optional-dependencies = {
  };

#  nativeCheckInputs = [
#    pytest-mock
#    pytest-xdist
#    pytestCheckHook
#  ] ++ optional-dependencies.socks;

  #pythonImportsCheck = [ "build123d" ];

  meta = with lib; {
    description = "a python-based, parametric, boundary representation (BREP) modeling framework for 2D and 3D CAD";
    homepage = "https://build123d.readthedocs.io/en/latest/index.html";
    changelog = "";
    license = licenses.asl20;
    maintainers = with maintainers; [ gumyr ];
  };
}