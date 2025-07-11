{
  inputs = {nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";};
  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    pkgs = import nixpkgs {system = "x86_64-linux";};
  in {
    devShells.x86_64-linux.default = pkgs.mkShell {
      packages = with pkgs; [
        hugo
      ];
    };
  };
}
