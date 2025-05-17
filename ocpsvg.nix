{
  lib,
  stdenv,
  buildPythonPackage,
  fetchPypi,
  pythonOlder,
  setuptools,
  setuptools_scm,
  svgelements,
}:


buildPythonPackage rec {
  pname = "ocpsvg";
  version = "0.4.0";
  format = "wheel";
  python = "py3";
  dist = "py3";

  disabled = pythonOlder "3.7";

  __darwinAllowLocalNetworking = true;

  src = fetchPypi {
    inherit pname version format python dist;
    sha256 = "sha256-cY9Nk3ovk8ae3OGcnu+bbigJUsWaiCwjNmo0X7fKHFk=";
  };

  dependencies = [
    setuptools
    setuptools_scm
    svgelements
  ];

  optional-dependencies = {
  };

  meta = with lib; {
    description = "convert SVG path strings to and from TopoDS_Edge, TopoDS_Wire, and TopoDS_Face objects";
    homepage = "";
    changelog = "";
    license = licenses.asl20;
    maintainers = with maintainers; [  ];
  };
}