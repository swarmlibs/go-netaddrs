# About

Inspired by [go-discover](https://github.com/hashicorp/go-discover), `go-netaddrs` is a Go (golang) library and command line tool to discover ip addresses of nodes in a customizable fashion suitable for any environment. It returns IP addresses (IPv4 or IPv6) given a
1. DNS name, OR
2. custom executable with optional args which (refer to examples under the folder `sample_scripts/`):
    * on success - exits with 0 and prints whitespace delimited IP (v4/v6) addresses to stdout.
    * on failure - exits with a non-zero code and optionally prints an error message of up to 1024 bytes to stderr.

https://github.com/hashicorp/go-netaddrs
