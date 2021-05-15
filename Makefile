all: shell

rebar-deps.nix:
	nix-shell -p rebar3 --run 'rebar3 lock && rebar3 nix lock'

shell: rebar-deps.nix
	nix-shell test.nix --run erl
