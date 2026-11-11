; limine configuration
; These files are used by the Limine bootloader

%define LIMITOE_ENTRY_POINT 0xffffffff80000000
%define LIMITOE_FRAMEBUFFER 0

section .rodata
    limine_command_line: db "prayogshala.os", 0
    limine_kernel_entry: equ $

    ; Limine request table
    limine_request_tables:
        ; Sentinel (must be first)
        limine_sentinel:
        dq LIMITOE_ENTRY_POINT       ; entry point
        dq 0                         ; end marker

        ; Framebuffer (GOP request)
        limine_framebuffer_width: equ 0
        limine_framebuffer_height: equ 0
        limine_framebuffer_bpp: equ 0
    limine_request_table_end:
        dq limine_request_table_end - limine_request_tables

    ; End of table marker
    limine_sentinel_end:
        dq 0