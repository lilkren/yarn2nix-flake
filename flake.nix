{
    inputs = {
        yarn2Nix = {
            url = "github:Profpatsch/yarn2Nix";
            flake = false;
        };
    };

  outputs = inputs@{ self, ... }: 
    let 
      yarn2Nix = (nixpkgs.callPackage ((import inputs.yarn2Nix).yarn2Nix) {});
    in {
      packages = {
          inherit yarn2Nix;
      }; 

      defaultPackage = self.packages.yarn2Nix;
    };
}
