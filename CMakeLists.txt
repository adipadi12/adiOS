# CMakeLists.txt - Prayogshala OS build configuration
cmake_minimum_required(VERSION 3.22)
project(prayogshala C ASM)

set(CMAKE_C_COMPILER clang)
set(CMAKE_ASM_NASM_COMPILER nasm)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}
    -ffreestanding
    -Wall
    -Wextra
    -O2
    -m64
")

set(CMAKE_ASM_NASM_FLAGS "-f elf64")

add_executable(prayogshala
    boot/start.asm
    kernel/kernel.c
)

target_include_files(prayogshala
    kernel/kernel.c
)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}")