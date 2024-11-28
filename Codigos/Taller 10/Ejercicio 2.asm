section .data
sum dd 0
numbers dd 5, 8, 12, -3, 6, 10, 0 ; Lista de números terminando en 0
ptr dd numbers

section .text
global _start

_start:
    mov eax, 0          ; Inicializa sum a 0
    mov ebx, [ptr]      ; Lee el primer número

do_while_start:
    add eax, ebx        ; Añade el número actual a sum
    add ptr, 4          ; Mueve el puntero al siguiente número
    mov ebx, [ptr]      ; Lee el siguiente número
    CMP ebx, 0          ; Verifica si el número es negativo
    JS end_do_while     ; Salta si es negativo

    JMP do_while_start  ; Repite el bucle

end_do_while:
    ; Finalizar el programa
    mov eax, 1          ; Syscall para salir
    xor ebx, ebx
    int 0x80

