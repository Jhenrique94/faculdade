
  .data

msg:
  .ascii "Hello, World\n"

  .global _start
    
  .text

# Program entry point
_start:

  # write(1, messge, 13)
  mov $4,   %eax     
  mov $1,   %ebx      
  mov $msg, %ecx    
  mov $12,  %edx     
  int $0x80        

  mov $0, %ebx      
  mov $1, %eax      
  int $0x80
