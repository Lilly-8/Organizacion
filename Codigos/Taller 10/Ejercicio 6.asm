section .data
num1 db 5               ; Primer número
num2 db 3               ; Segundo número
result db 0             ; Resultado de la suma
msg db "Resultado: ", 0
resultStr db "00", 10
zeroMsg db "Esto es un cero", 10

section .text
global _start

_start:
    ; Suma num1 y num2
    mov al, [num1]
    add al, [num2]
    mov [result], al

    CMP al, 0
    JZ print_zero       ; Salta si el resultado es 0

    ; Convertir el resultado a ASCII y mostrarlo
    add al, '0'
    mov [resultStr], al

    ; Imprimir el mensaje de resultado
    mov eax, 4          ; Syscall para escribir
    mov ebx, 1          ; Salida estándar (stdout)
    mov ecx, msg        ; Dirección del mensaje
    mov edx, 11         ; Longitud del mensaje
    int 0x80            ; Llamada al sistema

    ; Imprimir el resultado
    mov eax, 4
    mov ebx, 1
    mov ecx, resultStr
    mov edx, 2
    int 0x80

    JMP end_program

print_zero:
    ; Imprimir "Esto es un cero"
    mov eax, 4
    mov ebx, 1
    mov ecx, zeroMsg
    mov edx, 16
    int 0x80

end_program:
    ; Finalizar el programa
    mov eax, 1
    xor ebx, ebx
    int 0x80
