{
  lib,
  stdenv,
  buildPythonPackage,
  fetchPypi,
  pythonOlder,
  setuptools,
  setuptools_scm,
  cadquery-ocp
}:


buildPythonPackage rec {
  pname = "setuptools_scm";
  version = "8.3.1";
  format = "wheel";
  python = "py3";


  disabled = pythonOlder "3.7";

  __darwinAllowLocalNetworking = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-PVVekrddrNA30yuv35T5evUeoprox7I0z5S3pb0kKmM=";
  };

  dependencies = [
    setuptools
    setuptools_scm
    cadquery-ocp
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