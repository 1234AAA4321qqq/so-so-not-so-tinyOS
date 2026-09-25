# so so not so tinyOS

A custom Debian-based Linux ISO. Not tiny. Not NOT tiny either. Somewhere in between.

Built entirely in the cloud with GitHub Actions — zero local dev environment required.

## What's inside

- Debian 12 (Bookworm) minimal base
- Openbox window manager
- PCManFM file manager
- LXTerminal
- Python 3, Go, and `uv`
- Preinstalled: [autoserver](https://github.com/tinybinary-idk/autoserver)
- Auto-login as `akira` (password: `akira`)
- Root password: `root`

## Download

Grab the ISO from the [Releases](../../releases) page.

## Flash to USB

```sh
sudo dd if=soso-not-so-tinyOS-*.iso of=/dev/sdX bs=4M status=progress oflag=sync
```

Replace /dev/sdX with your USB device. Check with lsblk first — do NOT guess.

Or use balenaEtcher / Ventoy.

Build it yourself

Push a tag to trigger the workflow:

```sh
git tag v1.0.0
git push origin v1.0.0
```

The ISO builds automatically (~25-40 minutes) and gets attached to the release.

Size

Expect a ~500-600 MB ISO.

Known limitations

· No browser (intentional — install one yourself: sudo apt install firefox-esr)
· No display manager (auto-login on tty1 via agetty)
· Built for amd64 only
