{
  description = "Dats NixOS dotfiles from datsfilipe.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, ... }:
    let
      vars = {
        user = "dtsf";
        location = "$HOME/.setup";
        terminal = "wezterm";
        editor = "nvim";
        browser = "chrome";
      };
    in {
      nixosConfigurations = (
        import ./hosts {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs vars;
      });
      homeMConfigurations = (
        import ./home {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs vars;
      });
    };
}
