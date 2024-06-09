{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    neovim.url = "github:nix-community/neovim-nightly-overlay";
    stylix.url = "github:danth/stylix";
  };
  outputs = inputs: {
    homeManagerModules = {
      default = (import "./") inputs;
    };
  };
}
