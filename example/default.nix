{ petstore-client = import ../openapi-hs-generator.nix {
    pkgs = (import ./reflex-platform {}).nixpkgs;
    specFile = builtins.fetchurl {
      url = "https://petstore.swagger.io/v2/swagger.json";
      sha256 = "1d0azdbjyrwi66z0hy8d3zf7giwbqckmknxnq429k5mxa76hmchh";
    };
    packageName = "petstore-client";
    baseModule = "PetStore";
  };
}
