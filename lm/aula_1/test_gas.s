# Text segment begins

.section .text

  .global _start

# Program entry point
  _start:

# Put the code number for system call
      mov $1, %eax

# Return value
      mov $2, %ebx

# Call the OS
      int $0x80
