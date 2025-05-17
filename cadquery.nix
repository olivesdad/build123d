{
  lib,
  stdenv,
  buildPythonPackage,
  fetchPypi,
  pythonOlder,
  setuptools,
  cadquery-ocp,
}:


buildPythonPackage rec {
  pname = "cadquery";
  version = "2.5.2";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  __darwinAllowLocalNetworking = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-xduNcfZYHMK6rJ5pScqXXpKTVBWA3ISZ9buQMjtOitc=";
  };

  dependencies = [
    setuptools
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