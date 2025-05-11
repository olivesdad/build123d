{
  lib,
  stdenv,
  buildPythonPackage,
  certifi,
  chardet,
  charset-normalizer,
  fetchPypi,
  pythonOlder,
  setuptools,
  fetchFromGitHub,
}:

buildPythonPackage rec {
  pname = "cadquery-ocp";
  version = "7.8.1.1";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  __darwinAllowLocalNetworking = true;

  src = fetchFromGitHub {
    owner = "CadQuery";
    repo = "pywrap";
    rev = "master";
    hash = "sha256-u+P/SUGpYhzA1oVbEv26DF8PBEpsotEk4iXIXZhgzHc=";
  };


  dependencies = [
    setuptools
  ];

  optional-dependencies = {
  };


  #pythonImportsCheck = [ "cadquery-ocp" ];

  meta = with lib; {
    description = "Python wrapper for OCCT generated using pywrap";
    homepage = "";
    changelog = "";
    license = licenses.asl20;
    maintainers = with maintainers; [  ];
  };
}