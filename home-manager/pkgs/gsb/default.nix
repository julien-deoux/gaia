{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  pname = "gsb";
  version = "1.0";
  src = ./.;
  installPhase = ''
    mkdir -p $out/bin
    cp gsb.sh $out/bin/gsb
    chmod +x $out/bin/gsb
  '';
  meta = {
    description = "Stale branches";
    license = pkgs.lib.licenses.mit;
  };
}
