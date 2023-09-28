{
  inputs = {
    nixpkgs.url = "nixpkgs";
    nix-filter.url = "github:numtide/nix-filter";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    flake-utils,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs =
        import inputs.nixpkgs
        {
          inherit system;
        };
    in {
      inherit pkgs;

      devShells.default = pkgs.mkShell {
        name = "www.vinkland.xyz";
        buildInputs = [
          pkgs.hugo
          pkgs.go_1_21
          pkgs.gotools
          pkgs.gopls
          pkgs.sqlite
        ];
      };
    });
}
