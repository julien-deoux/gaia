{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  pname = "gpsu";
  version = "1.0";
  src = ./.;
  installPhase = ''
    mkdir -p $out/bin
    cp gpsu.sh $out/bin/gpsu
    chmod +x $out/bin/gpsu
  '';
  meta = {
    description = "Push to origin with set-upstream";
    license = pkgs.lib.licenses.mit;
  };
}
