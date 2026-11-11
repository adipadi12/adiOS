/* linker.ld - Linker script for Prayogshala OS */

ENTRY(start)

SECTIONS
{
    /* Boot loader will set up identity mapping or use direct physical addressing */
    . = 1M; /* Start kernel at 1MB physical address */

    .text : {
        *(.text)
    }

    .rodata : {
        *(.rodata)
    }

    .data : {
        *(.data)
    }

    .bss : {
        *(.bss)
    }

    /* Kernel end symbol */
    __kernel_end = .;
}