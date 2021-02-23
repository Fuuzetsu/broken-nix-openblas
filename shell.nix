let
  pkgs = import (fetchTarball {
    url =
      "https://github.com/NixOS/nixpkgs/archive/6739ee702167a2288189aa6a72afd1c8aedcf70d.tar.gz";
    sha256 = "sha256:1hrzz8z1z4gjlj5yzqy13224cszp9xnvfnydv3gl1y3hqjq3ldnj";
  }) { };

in with pkgs;

mkShell {
  buildInputs = [ gfortran openblas ];
  # Required by test-suite and in general let's set a uniform one.
  LANG = "C.UTF-8";
}
