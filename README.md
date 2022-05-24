# pridefetch 🏳️‍⚧️

![pridefetch screenshot](https://file.coffee/u/J0dk4lIjU5Wmdu.png)<br>
Python fetch script for showing your favourite pride flags & system stats!<br>
Originally forked from [megabytesofrem/pridefetch](https://github.com/megabytesofrem/pridefetch).<br>

## Examples

#### Display a trans flag

`pridefetch -f trans`

#### Display either a trans or lesbian flag, with a 50/50 chance

`pridefetch -r trans,lesbian`

#### List all the available flags

`pridefetch -l`

#### Display help with pridefetch

`pridefetch -h`

## Quickstart

**Requirements:** `Python 3.7` or higher and `python-distro`
```bash
git clone https://github.com/SpyHoodle/pridefetch.git
cd pridefetch
chmod +x pridefetch
```

Then, run pridefetch

```bash
./pridefetch
```

You can also add pridefetch to your `$PATH` to run it anywhere<br>

```bash
mv pridefetch /usr/bin/
```

## Running on NixOS
#### If your system supports flakes
> ⚠ Note: This has only been tested on x86_64-linux; it may or may not work on your system

You can run pridefetch straight away

```bash
nix run github:SpyHoodle/pridefetch
```

Or, install it and then run

```bash
nix profile install github:SpyHoodle/pridefetch
pridefetch
```

## Made with ❤️ and 🏳️‍⚧
 - Pridefetch is at an early stage, so may not work on all systems. 
 - Please report any issues or bugs on the Issues tab
 - Checkout our [contributing guidelines](https://github.com/SpyHoodle/pridefetch/blob/master/CONTRIBUTING.md) if you'd like to contribute.