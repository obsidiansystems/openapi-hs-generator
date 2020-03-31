# openapi-hs-generator

Generate haskell api client libraries from OpenAPI/swagger spec files.

## Example Usage

### Command line

```bash
nix-build /path/to/openapi-hs-generator.nix --arg pkgs 'import /path/to/nixpkgs {}' --arg specFile /path/to/specFile --argstr packageName myPackage --argstr baseModule MyPackage
```

### nix file for a given API

See the [pet store example](example).

## Customization

If you need to replace strings in the cabal file (to, e.g., modify package versions), use the `cabalFileReplacements` argument.

To add things to the end of the cabal file, use `cabalFileAppendix`.

To set the cabal version, use `versionFn`, which provides you with the api version in case you want to base your package version on that in some way.
