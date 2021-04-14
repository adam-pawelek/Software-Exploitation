section   .text
global    _start

_start:
  ; write(msg, len)
  ; syscall(4, fd, msg, len)
  mov     eax, 4                        ; syscall (4=write)
  mov     ebx, 1                        ; fd=1 (stdout)
  mov     ecx, msg
  mov     edx, len
  int     0x80                          ; interrupt to kernel

  ; exit(code)
  ; syscall(1, code)
  mov     eax, 1                        ; syscall (1=exit)
  mov     ebx, 0                        ; code=0
  int     0x80                          ; interrupt to kernel

section   .data
  msg     db  'Hello, world.', 0xa      ; define bytes for string
  len     equ $ - msg                   ; declare symbolic variable 'len'
                                        ;   $         current address
                                        ;   msg       address of 'msg'
                                        ;   $ - msg   length of message
