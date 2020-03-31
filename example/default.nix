let pkgs = (import ./reflex-platform {}).nixpkgs;
    packageName = "petstore-client";
in
{ petstore-client = (import ../. {
    inherit pkgs packageName;
    specFile = builtins.fetchurl {
      url = "https://petstore.swagger.io/v2/swagger.json";
      sha256 = "1d0azdbjyrwi66z0hy8d3zf7giwbqckmknxnq429k5mxa76hmchh";
    };
    baseModule = "PetStore";
  }).overrideAttrs (attrs: {
    # Below, we modify the generated readme file
    installPhase = attrs.installPhase + ''
      sed -i\'\' -n '/^###\ Modules/,$p' $out/README.md
      echo "# ${packageName}

      A haskell api client for the swagger petstore server.

      This package was generated using [openapi-hs-generator](https://github.com/obsidiansystems/openapi-hs-generator), which is built on the [openapi-generator](https://openapi-generator.tech/) and [nix](https://nixos.org).

      $(cat $out/README.md)" > $out/README.md
    '';
  });
}
