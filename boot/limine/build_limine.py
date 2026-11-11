#!/usr/bin/env python3
"""Limine build script - creates the binary bootloader configuration"""

import struct
import os
import sys

def create_limine_config():
    """Create the Limine binary configuration for Prayogshala OS"""

    # Limine entry point structure
    entry = b'\x00' * 16  # padding for entry structure

    # Sentinel table (must be at the start of the configuration)
    # Format: [entry_point: 8 bytes] [0: 8 bytes end marker]
    sentinel = struct.pack('<QQ', 0xffffffff80000000, 0)

    # Framebuffer request - we'll request the UEFI GOP framebuffer
    # The actual values will be filled in by the bootloader
    framebuffer_request = struct.pack('<QQQ', 0, 0, 0)  # width, height, bpp

    # Kernel command line
    cmd_line = b'prayogshala.os\x00'

    # Total configuration size
    config = sentinel + framebuffer_request + cmd_line

    return config

if __name__ == '__main__':
    config = create_limine_config()
    with open('boot/limine/limine.bin', 'wb') as f:
        f.write(config)
    print(f"Created limine.bin: {len(config)} bytes")

if __name__ != '__main__':
    # Module export
    limine_config = create_limine_config()