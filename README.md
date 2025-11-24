# ayangd's NixOS Configuration

Currently, this repository only hosts my Home Manager configuration.
The NixOS configuration will be added later.

## Using

No. I actually doesn't know how to activate this from scratch. Maybe I'll try to activate this and document it when I have the time.

## Custom Package

When adding custom package, see `packages/gitlogue.nix` for example.
The configuration must follow what the package compiles to, for example, the
`gitlogue` package compiles using rust's `cargo`.
Then, with the hash, use fake hash first, run it to get the error with the
correct hash, then replace the fake hash with the correct hash.
The fake hash can be `sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=`.
