{
  description = "rhinofi's flake deps";
  inputs = {
    # NOTE: the specific url here doesn't matter as it will be overriden
    # using lockFileProcessorFunc passed to default.nix. This way the consumer
    # of this flake, can decide which nixpkgs to use.
    nixpkgs-lib.url = "github:nixos/nixpkgs/8e3fad82be64c06fbfb9fd43993aec9ef4623936?dir=lib";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs-lib";
    };
    systems.url = "github:nix-systems/default";
    process-compose-flake.url = "github:rhinofi/process-compose-flake/rhinofi";
    services-flake.url = "github:rhinofi/services-flake/rhinofi";
    flake-compat = {
      url = "github:rhinofi/flake-compat/lock-file-overrides";
      flake = false;
    };

  };
  outputs = inputs: {};
}
