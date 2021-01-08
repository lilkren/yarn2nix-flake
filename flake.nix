{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.09";
        yarn2Nix = {
            url = "github:Profpatsch/yarn2Nix";
            flake = false;
        };
    };

  outputs = inputs@{ self, nixpkgs, ... }: 
    let 
      yarn2Nix = (nixpkgs.callPackage ((import inputs.yarn2Nix).yarn2Nix) {});
    in {
      packages = {
          inherit yarn2Nix;
      }; 

      defaultPackage = self.packages.yarn2Nix;
    };
}
