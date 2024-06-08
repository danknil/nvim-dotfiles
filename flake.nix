{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    neovim.url = "github:nix-community/neovim-nightly-overlay";
    stylix.url = "";
  };
  outputs = inputs: 
  {
    homeManagerModules = {
      default = ./ inputs;
    };
  };
}
