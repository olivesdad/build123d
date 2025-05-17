{
  lib,
  stdenv,
  buildPythonPackage,
  fetchPypi,
  pythonOlder,
  setuptools,
}:


buildPythonPackage rec {
  pname = "svgelements";
  version = "1.9.6";
  format = "wheel";

  disabled = pythonOlder "3.7";

  __darwinAllowLocalNetworking = true;

  src = fetchPypi {
    inherit pname version format;
    hash = "sha256-ilzyzAZtmOcT1bh1sdbl7rm5LoVeg169fKqycTrh3K0=";
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