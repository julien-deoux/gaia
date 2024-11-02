{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  pname = "gca";
  version = "1.0";
  src = ./.;
  installPhase = ''
    mkdir -p $out/bin
    cp gca.sh $out/bin/gca
    chmod +x $out/bin/gca
  '';
  meta = {
    description = "Quickly amend last Git commit";
    license = pkgs.lib.licenses.mit;
  };
}
