{ # Pinned nixpkgs to use. We'll use the openapi-generator found within.
  pkgs

  # The OpenAPI spec file from which we're going to generate the api client
, specFile

  # Name of the cabal package
, packageName

  # Base module of the cabal package
, baseModule

  # Function to generate cabal version from the API version
, versionFn ? (x: x)

  # Map of strings to find in the generated cabal file and strings to replace them with
  # E.g., { "Author Name Here" = "Obsidian Systems LLC"; } 
, cabalFileReplacements ? {}

  # String to append to the bottom of the cabal file
, cabalFileAppendix ? ""
}:
let specJson = if pkgs.lib.hasSuffix ".yaml" specFile
      then 
        builtins.fromJSON (builtins.readFile (pkgs.runCommand "spec.json" {} ''
          ${pkgs.yaml2json}/bin/yaml2json < ${specFile} | ${pkgs.perl}/bin/json_pp > $out
        ''))
      else if pkgs.lib.hasSuffix ".json" specFile
        then builtins.fromJSON (builtins.readFile specFile)
        else builtins.throw "spec file was not a .yaml or .json file.";
    # We generate the openapi-generate-cli config file so that it can include the generated cabal version number
    version = versionFn specJson.info.version;
    cfg = pkgs.writeText "config.json" ''
      { "cabalPackage":"${packageName}",
        "cabalVersion":"${version}",
        "baseModule":"${baseModule}"
      }
    '';
in pkgs.stdenv.mkDerivation {
  name = packageName;
  inherit version;
  src = ./.;
  buildPhase = "";
  # In this phase, we're going to run the generator and then do some substitutions in the resulting files
  installPhase = ''
    mkdir $out
    mkdir tmp
    ${pkgs.openapi-generator-cli}/bin/openapi-generator-cli generate -g haskell-http-client -o tmp -i "${specFile}" -c "${cfg}"
    substituteInPlace tmp/${packageName}.cabal \
    ${builtins.concatStringsSep " \\\n"
        (builtins.attrValues
          (builtins.mapAttrs (a: b: "  --replace \"${a}\" \"${b}\"") cabalFileReplacements))}
    cat >> tmp/${packageName}.cabal <<EOF

    ${cabalFileAppendix}
    EOF
    cp -r tmp/* $out
  '';
}
