{
  lib,
  stdenv,
  buildPythonPackage,
  fetchPypi,
  pythonOlder,
  setuptools,
}:


buildPythonPackage rec {
  pname = "svgpathtools";
  version = "1.7.0";
  format = "setuptools";


  disabled = pythonOlder "3.7";

  __darwinAllowLocalNetworking = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-vctt7c5F/CMHyWEZ0PcgurJDQYp1PFFKp8Qjs5KJUZw=";
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