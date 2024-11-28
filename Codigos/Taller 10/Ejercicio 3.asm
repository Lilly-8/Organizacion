section .data
product dd 1

section .text
global _start

_start:
    mov eax, 1          ; Inicializa product a 1
    mov ecx, 1          ; Inicializa i a 1

for_loop_start:
    CMP ecx, 6          ; Verifica si i > 5
    JG end_for_loop     ; Salta si i > 5

    mul ecx             ; Multiplica product por i
    inc ecx             ; Incrementa i
    JMP for_loop_start  ; Repite el bucle

end_for_loop:
    ; Finalizar el programa
    mov eax, 1          ; Syscall para salir
    xor ebx, ebx
    int 0x80
