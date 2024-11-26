{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  pname = "grb";
  version = "1.0";
  src = ./.;
  installPhase = ''
    mkdir -p $out/bin
    cp grb.sh $out/bin/grb
    chmod +x $out/bin/grb
  '';
  meta = {
    description = "Reset beta";
    license = pkgs.lib.licenses.mit;
  };
}
