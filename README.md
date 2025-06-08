# Forgejo RAM Runner

This repository contains a minimalistic [archiso profile](https://wiki.archlinux.org/title/Archiso) that installs a Forgejo runner entirely in RAM. The goal of this project is to spawn ephemeral runners that do not write any data to disk.

## Usage

```bash
sudo mkarchiso -v -w /tmp -o . ./runner
qemu-system-x86_64 -bios /usr/share/ovmf/x64/OVMF.4m.fd -enable-kvm -m 8G -cpu host -smp 16 -vga virtio -cdrom ./*.iso
```

## Disclaimer
This is not an officially supported or endorsed project by any organization and it is solely a personal effort.