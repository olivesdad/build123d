{
  lib,
  stdenv,
  buildPythonPackage,
  fetchPypi,
  pythonOlder,
  setuptools,
  fetchurl,
}:


buildPythonPackage rec {
  pname = "py_lib3mf";
  version = "2.3.1";
  format = "wheel";
  python = "py3";
  dist = "py3";
  abi = "none";
  platform = "any";

  disabled = pythonOlder "3.7";

  __darwinAllowLocalNetworking = true;

  src = fetchPypi {
    inherit pname version format python dist abi platform;
    sha256 = "sha256-hqhw7zht67qbdGg9OggSWjTBU6qmXpZ/YWd8xaCmXiQ=";
    
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