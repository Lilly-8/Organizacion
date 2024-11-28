section .data
sum dd 0
count dd 1

section .text
global _start

_start:
    mov eax, 0          ; Inicializa sum a 0
    mov ecx, 1          ; Inicializa count a 1

while_start:
    CMP ecx, 11         ; Verifica si count <= 10
    JGE end_while       ; Salta si count > 10

    add eax, ecx        ; Suma count a sum
    inc ecx             ; Incrementa count
    JMP while_start     ; Repite el bucle

end_while:
    ; Aquí puedes agregar código para mostrar el valor de sum si es necesario

    ; Finalizar el programa
    mov eax, 1          ; Syscall para salir
    xor ebx, ebx
    int 0x80


