{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  pname = "gmb";
  version = "1.0";
  src = ./.;
  installPhase = ''
    mkdir -p $out/bin
    cp gmb.sh $out/bin/gmb
    chmod +x $out/bin/gmb
  '';
  meta = {
    description = "Merge current branch in beta";
    license = pkgs.lib.licenses.mit;
  };
}
