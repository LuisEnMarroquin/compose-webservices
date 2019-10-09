# code-server

`code-server` is [VS Code](https://github.com/Microsoft/vscode) running on a
remote server, accessible through the browser.

- **Consistent environment:** Code on your Chromebook, tablet, and laptop with a
  consistent dev environment. develop more easily for Linux if you have a
  Windows or Mac, and pick up where you left off when switching workstations.
- **Server-powered:** Take advantage of large cloud servers to speed up tests,
  compilations, downloads, and more. Preserve battery life when you're on the go
  since all intensive computation runs on your server.

### Requirements

- Minimum GLIBC version of 2.17 and a minimum version of GLIBCXX of 3.4.15.
  - This is the main requirement for building Visual Studio Code. We cannot go lower than this.
- A 64-bit host with at least 1GB RAM and 2 cores.
  - 1 core hosts would work but not optimally.
- Docker (for Docker versions of `code-server`).

### Digital Ocean

[Create a Droplet](https://m.do.co/c/856dc39cd657)

### Known Issues

- Creating custom VS Code extensions and debugging them doesn't work.
- Extension profiling and tips are currently disabled.

### Extensions

`code-server` does not provide access to the official
[Visual Studio Marketplace](https://marketplace.visualstudio.com/vscode). Instead,
Coder has created a custom extension marketplace that we manage for open-source
extensions. If you want to use an extension with code-server that we do not have
in our marketplace please look for a release in the extension’s repository,
contact us to see if we have one in the works or, if you build an extension
locally from open source, you can copy it to the `extensions` folder. If you
build one locally from open-source please contribute it to the project and let
us know so we can give you props! If you have your own custom marketplace, it is
possible to point code-server to it by setting the `SERVICE_URL` and `ITEM_URL`
environment variables.

### Telemetry

Use the `--disable-telemetry` flag to completely disable telemetry. We use the
data collected to improve code-server.

### Upgrading VS Code

Please don't

### License

[MIT](LICENSE)
