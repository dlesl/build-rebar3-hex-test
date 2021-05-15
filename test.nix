{ pkgs ? import <nixpkgs> { } }:
with pkgs;
let
  deps = import ./rebar-deps.nix {
    inherit fetchHex fetchFromGitHub;
    builder = args:
      beamPackages.buildRebar3
      (args // { buildPlugins = [ beamPackages.pc ]; });
  };
in mkShell {
  name = "test-shell";
  buildInputs = [ erlang ] ++ (builtins.attrValues deps);
}
