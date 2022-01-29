# RUST

let
  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  nixpkgs = import <nixpkgs> { overlays = [ moz_overlay ]; };
in

with nixpkgs;

mkShell {
  name = "rust";
  buildInputs = [ cargo-make watchexec clippy rustfmt rust-analyzer lld pkgconfig
  latest.rustChannels.stable.cargo
  latest.rustChannels.stable.rust-src
  latest.rustChannels.stable.rust
  ];

  shellHook = ''
    export PATH=$PATH:~/.cargo/bin
  '';
}
