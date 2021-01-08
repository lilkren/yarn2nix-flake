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
        system = "x86_64-linux";
        npkgs = ((import nixpkgs) {
            inherit system;
        });
        yarn2Nix = (nixpkgs.callPackage ((import inputs.yarn2Nix).yarn2Nix) {});
    in {
        packages."${system}" = {
            inherit yarn2Nix;
        }; 

        defaultPackage."${system}" = self.packages.yarn2Nix;
    };
}
