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
  fetchurl,
  system,
}:


buildPythonPackage rec {
  pname = "cadquery_ocp";
  version = "7.8.1.1.post1";
  format = "wheel";
  platform = builtins.head (builtins.split "-" "${system}");
  dist = "cp312";
  python = "cp312-cp312";
  abi = "manylinux_2_31";

  disabled = pythonOlder "3.7";

  __darwinAllowLocalNetworking = true;

  src = fetchurl {
    url =  "https://files.pythonhosted.org/packages/${dist}/${builtins.substring 0 1 pname}/${pname}/${pname}-${version}-${python}-${abi}_${platform}.whl";
    sha256 = "sha256-SIIHToZyIggVNXm6ruJGvk+xC9oi3CDRAcQVHzZCB7k=";
    hash = "";
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