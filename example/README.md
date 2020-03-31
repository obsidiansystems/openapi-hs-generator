# petstore-client example

This example generates bindings to the sample swagger petstore server. The server's [API is documented here](https://petstore.swagger.io/).

`default.nix` retrieves the json version of the spec found at [/v2/swagger.json](https://petstore.swagger.io/v2/swagger.json) and verifies that it matches the expected hash. It also sets a few parameters used to generate the haskell client library.

The resulting haskell library (which can also be produced by running `nix-build`) is in the [petstore-client](petstore-client) folder.
