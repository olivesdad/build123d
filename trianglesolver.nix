{
  lib,
  stdenv,
  buildPythonPackage,
  fetchPypi,
  pythonOlder,
  setuptools,
}:


buildPythonPackage rec {
  pname = "trianglesolver";
  version = "1.2";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  __darwinAllowLocalNetworking = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-SvGKreV51cDWQ4mz5lrq8Gz/JjGXYszYWeMmhVmnauo=";
  };

  dependencies = [
    setuptools
  ];

  optional-dependencies = {
  };

  meta = with lib; {
    description = "This little package applies the law of sines or cosines to find all the sides and angles of a triangle, if you know some of the sides and/or angles.";
    homepage = "";
    changelog = "";
    license = licenses.asl20;
    maintainers = with maintainers; [  ];
  };
}