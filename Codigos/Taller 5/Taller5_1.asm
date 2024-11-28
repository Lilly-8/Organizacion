section .data
msg db 'Imprimir input del teclado: ', 0
newline db 0xA          ; Nueva línea
input db 'organizacion', 0 ; Entrada predefinida

section .bss
sum resb 1              ; Espacio para la suma

section .text
global _start

_start:
    ; Mostrar mensaje en pantalla
    mov eax, 4
    mov ebx, 1
    mov ecx, msg         ; Dirección del mensaje
    mov edx, 25          ; Longitud del mensaje
    int 0x80

    ; Mostrar la entrada predefinida
    mov eax, 4
    mov ebx, 1
    mov ecx, input       ; Dirección de la cadena "organizacion"
    mov edx, 11          ; Longitud de "organizacion"
    int 0x80

    ; Imprimir nueva línea
    mov eax, 4
    mov ebx, 1
    mov ecx, newline     ; Nueva línea
    mov edx, 1
    int 0x80

    ; Terminar el programa
    mov eax, 1
    xor ebx, ebx
    int 0x80
