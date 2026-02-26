# suclaude

Run [Claude Code](https://docs.anthropic.com/en/docs/claude-code) as root with `--dangerously-skip-permissions`.

Claude Code refuses to use `--dangerously-skip-permissions` when running as root. `suclaude` bypasses this check by injecting a tiny `LD_PRELOAD` shim that makes `getuid()` and `geteuid()` return 1000, while the process keeps full root privileges.

## Installation

```sh
git clone https://github.com/cli-tools/suclaude.git
cd suclaude
make install
```

This installs to `~/.local/bin/suclaude` and `~/.local/lib/fakeuid.so`.

## Usage

```sh
suclaude             # interactive session
suclaude -p "..."    # one-shot prompt
```

All arguments are forwarded to `claude --dangerously-skip-permissions`.

## Uninstall

```sh
make uninstall
```

## Requirements

- Claude Code (`claude` binary on PATH)
- GCC (for compiling the shared library)
- Linux (uses `LD_PRELOAD`)

## License

BSD Zero Clause (0BSD) — see [LICENSE](LICENSE).
