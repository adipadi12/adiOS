; boot/start.asm
; NASM assembly entry point for Prayogshala OS
; Compiles with: nasm -f elf64 boot/start.asm -o boot/start.o

section .text
    global start

start:
    ; Setup stack - use top of kernel virtual memory
    mov rsp, 0x100000      ; 1MB stack

    ; Call C kernel main
    call kernel_main

    ; If kernel_main returns, hang
    hlt
    jmp $

section .bss
    align 16
    stack_space: resb 4096