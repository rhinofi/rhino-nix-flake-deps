# Use lockFileProcessorFunc to override node.nixpkgs
lockFileProcessorFunc:
  (import
    (
      let
        lock = builtins.fromJSON (builtins.readFile ./flake.lock);
      in
        fetchTarball {
          url = "https://github.com/rhinofi/flake-compat/archive/${lock.nodes.flake-compat.locked.rev}.tar.gz";
          sha256 = lock.nodes.flake-compat.locked.narHash;
        }
    )
    {src = ./.; inherit lockFileProcessorFunc; }
  )
  .defaultNix
