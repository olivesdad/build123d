{
  lib,
  stdenv,
  buildPythonPackage,
  fetchPypi,
  pythonOlder,
  setuptools,
}:


buildPythonPackage rec {
  pname = "ezdxf";
  version = "1.4.1";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  __darwinAllowLocalNetworking = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-SAbkMoIU90E6lSt+UGZYioPjwNYA3ajF+G7tOM/NcGs=";
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