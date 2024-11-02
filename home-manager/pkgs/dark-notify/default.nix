{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  pname = "dark-notify";
  version = "0.1.2";
  src = fetchTarball {
    url = "https://github.com/cormacrelf/dark-notify/releases/download/v0.1.2/dark-notify-v0.1.2.tar.gz";
    sha256 = "11i7amcvff8akc1rvyz3xypkq30qd2vx9wk90m8175vp77slrlr6";
  };
  installPhase = ''
    mkdir -p $out/bin
    cp dark-notify $out/bin
  '';
  meta = {
    homepage = "https://github.com/cormacrelf/dark-notify";
    description = "Watcher for macOS 10.14+ light/dark mode changes";
  };
}
