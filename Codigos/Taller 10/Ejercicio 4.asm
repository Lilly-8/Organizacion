section .data
num dd 4
result_even db "El número es par", 10, 0
result_odd db "El número es impar", 10, 0

section .text
global _start

_start:
    mov eax, [num]
    test eax, 1         ; Verifica si el bit menos significativo es 0
    JZ even_case        ; Salta si es par

odd_case:
    ; Código para imprimir result_odd
    JMP end_if_else

even_case:
    ; Código para imprimir result_even

end_if_else:
    ; Finalizar el programa
    mov eax, 1          ; Syscall para salir
    xor ebx, ebx
    int 0x80
