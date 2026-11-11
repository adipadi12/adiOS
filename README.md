# Prayogshala OS

An experimental hobby operating system built from scratch, inspired by the surreal, unsettling, experimental atmosphere of the Indian movie *No Smoking (2007)*.

The name Prayogshala means "laboratory" in Sanskrit. This OS aims to create a controlled experimental computing environment rather than a conventional desktop operating system.

## Visual Identity

- Dark charcoal and near-black backgrounds
- Muted green, off-white, and occasional warning-red accents
- Monospaced and minimalist typography
- Retro CRT-inspired visual elements
- Industrial, brutalist, laboratory-inspired interface design
- Subtle animations and system messages
- Experimental, clinical atmosphere

## Tagline

"An environment for controlled experiments."

## Current Status

This is **Phase 1**: Bootable kernel. The kernel successfully boots in QEMU and displays its identity.

## Build & Run

```bash
# From the project directory
mkdir -p build && cd build
cmake ..
make
# Run with QEMU
qemu-system-x86_64 -bios ./boot/limine.sbf -cdrom ./prayogshala.iso
```

## Repository Structure

```
prayogshala/
├── boot/          # Bootloader and assembly entry
├── kernel/        # C kernel source
├── assets/        # fonts, themes, graphics
├── scripts/       # Build and test scripts
├── tests/         # Test infrastructure
├── CMakeLists.txt
├── linker.ld
└── README.md
```

## Design Philosophy

- Explain important systems programming concepts as we implement them
- Avoid overwhelming with unnecessary abstractions
- Prefer understandable code over clever code
- Follow modular architecture
- Keep kernel and hardware-specific code separated
- Write maintainable code with meaningful comments
- Explain why a particular implementation is needed
- Never introduce functionality that cannot be reasonably tested
- Do not pretend that something works without verification

Work is incremental, one milestone at a time.