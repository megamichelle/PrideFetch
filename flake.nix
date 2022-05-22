{
  description = "A flake to run pridefetch";

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
 
    forAllSystems = f: nixpkgs.lib.genAttrs nixpkgs.lib.systems.supported.hydra (system: f system);
  in rec {
    packages = forAllSystems (system: let 
      pkgs = import nixpkgs {
        inherit system;
      };
    in {
      pridefetch = pkgs.stdenv.mkDerivation {
        name = "pridefetch";
        buildInputs = [
          (pkgs.python39.withPackages (pythonPackages: with pythonPackages; [
            distro          
          ]))
        ];
        unpackPhase = "true";
        installPhase = ''
          mkdir -p $out/bin
          cp ${./pridefetch} $out/bin/pridefetch
          cp ${./packages.py} $out/bin/packages.py
          chmod +x $out/bin/pridefetch
        '';
      };
    });

    defaultPackage = forAllSystems (system: self.packages.${system}.pridefetch);
  };
}
