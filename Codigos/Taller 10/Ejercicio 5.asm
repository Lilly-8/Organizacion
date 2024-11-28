section .data
count dd 10

section .text
global _start

_start:
    mov ecx, 10         ; Inicializa count en 10

for_decrement_start:
    CMP ecx, 0          ; Verifica si count >= 1
    JL end_for_decrement ; Salta si count < 1

    ; Aquí iría el código para imprimir el valor de count
    dec ecx             ; Decrementa count
    JMP for_decrement_start ; Repite el bucle

end_for_decrement:
    ; Finalizar el programa
    mov eax, 1          ; Syscall para salir
    xor ebx, ebx
    int 0x80
