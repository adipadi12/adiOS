/* kernel/kernel.c - Prayogshala kernel main
 * Entry point called from boot/start.asm
 * Uses freestanding C environment (no standard library)
 */

#include <stdint.h>

/* VGA text mode buffer - writes to 0xB8000 */
#define VGA_BUFFER ((volatile uint16_t *)0xB8000)

/* Helper: write a character to VGA text mode at current position */
static void vga_putchar(char c, uint8_t color) {
    static uint16_t x = 0, y = 0;
    uint16_t character = (uint16_t)c | ((uint16_t)color << 8);

    if (c == '\n') {
        x = 0;
        y += 2;
        return;
    }

    if (c == '\r') {
        x = 0;
        return;
    }

    VGA_BUFFER[y * 80 + x] = character;
    x++;
    if (x >= 80) {
        x = 0;
        y++;
    }
}

/* Print a null-terminated string to VGA text mode */
static void vga_print(const char *str, uint8_t color) {
    while (*str) {
        vga_putchar(*str, color);
        str++;
    }
}

/* Kernel main - called from assembly entry point */
void kernel_main(void) {
    /* Clear screen by writing spaces */
    for (int i = 0; i < 25 * 80; i++) {
        VGA_BUFFER[i] = 0x20 | (0x0F << 8);  /* Space char with light gray on black */
    }

    /* Print Prayogshala identity */
    vga_print("Prayogshala OS - Experimental Kernel Boot\n", 0x0A); /* Green on black */
    vga_print("Initializing experiment...\n", 0x0A);
    vga_print("Experiment terminal active.\n", 0x0A);

    /* Infinite loop - kernel running */
    while (1) {
        __asm__ volatile ("hlt");
    }
}