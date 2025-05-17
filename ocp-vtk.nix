{
  lib,
  stdenv,
  buildPythonPackage,
  fetchPypi,
  pythonOlder,
  setuptools,
}:


buildPythonPackage rec {
  pname = "ocp_vtk";
  version = "7.5.3.0";
  python = "py3";
  format = "wheel";
  dist = "py3";

  disabled = pythonOlder "3.7";

  __darwinAllowLocalNetworking = true;

  src = fetchPypi {
    inherit pname version format python dist;
    hash = "sha256-X5ZP8KoZOMdnKeEkw1fqHCiFyPOhuw1PZBPhzFU8Tvw=";
  };

  dependencies = [
    setuptools
  ];

  optional-dependencies = {
  };

  meta = with lib; {
    description = "";
    homepage = "";
    changelog = "";
    license = licenses.asl20;
    maintainers = with maintainers; [  ];
  };
}