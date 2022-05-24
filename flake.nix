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
        buildInputs = with pkgs; [
          (python39.withPackages (pythonPackages: with pythonPackages; [
            distro          
          ]))
          zip
        ];
        unpackPhase = "true";
        installPhase = ''
          mkdir -p $out/bin
          cd ${./src}
          zip -r $out/pridefetch.zip *
          echo '#!/usr/bin/env python' | cat - $out/pridefetch.zip > $out/bin/pridefetch
          chmod +x $out/bin/pridefetch
          rm $out/pridefetch.zip
        '';
        meta = with pkgs.lib; {
          description = "Print out system statistics with pride flags";
          longDescription = ''
            Pridefetch prints your system statistics (similarly to neofetch, screenfetch or pfetch) along with a pride flag.
            The flag which is printed is configurable, as well as the width of the output.
          '';
          homepage = https://github.com/SpyHoodle/pridefetch;
          license = "bsd"; 
          # https://static.domenkozar.com/nixpkgs-manual-sphinx-exp/meta.xml.html
          # > Catch-all for licenses that are essentially similar to the original BSD license with the advertising clause removed, i.e. permissive non-copyleft free software licenses. This includes the X11 (“MIT”) License.
          # our license is MIT, so BSD is set here
          maintainers = [
            {
              email = "skyler3665@gmail.com";
              github = "minion3665";
              githubId = 34243578;
              name = "Skyler Grey";
            }
          ];  # TODO: Replace this with a reference to the maintainer list after adding myself to it
          platforms = systems.supported.hydra;
        };
      };
    });

    defaultPackage = forAllSystems (system: self.packages.${system}.pridefetch);
  };
}
