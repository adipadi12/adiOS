#!/bin/bash
# build.sh - Prayogshala OS build script
# Usage: ./build.sh

set -e

echo "=== Prayogshala OS Build ==="

# Step 1: Assemble boot entry point
echo "[1/4] Assembling boot/start.asm..."
nasm -f elf64 boot/start.asm -o boot/start.o
echo "  Boot object created."

# Step 2: Compile kernel C code
echo "[2/4] Compiling kernel/kernel.c..."
clang -ffreestanding -Wall -Wextra -O2 -m64 -c kernel/kernel.c -o kernel/kernel.o
echo "  Kernel object created."

# Step 3: Link kernel with boot
echo "[3/4] Linking kernel..."
clang -ffreestanding -O2 -m64 -T linker.ld boot/start.o kernel/kernel.o -o prayogshala.elf
echo "  ELF kernel created."

# Step 4: Create ISO image
echo "[4/4] Creating ISO image..."
mkdir -p iso/boot/limine
cp prayogshala.elf iso/boot/limine/
cp boot/limine/limine.cfg iso/boot/limine/ 2>/dev/null || true
# Create limine bootable ISO
xorriso -as mkisofs -b boot/limine/limine.efi \
  -no-emul-boot -boot-load-size 4 -E boot/limine/limine.efi \
  -isohybrid-mbr boot/limine/limine.bin -append_partition \
  -efi-partition 0xEF -EF-partition-type 0xfb \
  -isohybrid-bibba -isohhybrid-gpt protective \
  -o prayogshala.iso iso/
echo "  ISO image created: prayogshala.iso"

echo ""
echo "=== Build Complete ==="
echo "Run with: qemu-system-x86_64 -cdrom prayogshala.iso"