section .data
msg db 'Resultado: ', 0 ; Mensaje inicial (no se usa en esta modificación)
section .bss
buffer resb 4          ; Buffer para almacenar los caracteres a imprimir
section .text
global _start
_start:
    ; Imprimir 'A'
    mov al, 65         ; Código ASCII de 'A'
    mov [buffer], al   ; Guardar 'A' en el buffer
    call print_char    ; Llamar a la subrutina para imprimir el carácter

    ; Imprimir '\'
    mov al, 92         ; Código ASCII de '\'
    mov [buffer], al   ; Guardar '\' en el buffer
    call print_char    ; Llamar a la subrutina para imprimir el carácter

    ; Imprimir '$'
    mov al, 36         ; Código ASCII de '$'
    mov [buffer], al   ; Guardar '$' en el buffer
    call print_char    ; Llamar a la subrutina para imprimir el carácter

    ; Imprimir '&'
    mov al, 38         ; Código ASCII de '&'
    mov [buffer], al   ; Guardar '&' en el buffer
    call print_char    ; Llamar a la subrutina para imprimir el carácter

    ; Imprimir '1'
    mov al, 49         ; Código ASCII de '1'
    mov [buffer], al   ; Guardar '1' en el buffer
    call print_char    ; Llamar a la subrutina para imprimir el carácter

    ; Salir del programa
    mov eax, 1         ; Llamada al sistema para salir
    xor ebx, ebx       ; Código de salida 0
    int 0x80           ; Interrupción para finalizar el programa

; Subrutina para imprimir un carácter
print_char:
    mov eax, 4         ; Llamada al sistema para escribir
    mov ebx, 1         ; Descriptor del archivo: 1 (stdout)
    mov ecx, buffer    ; Dirección del buffer que contiene el carácter
    mov edx, 1         ; Longitud del carácter a imprimir
    int 0x80           ; Interrupción para invocar la llamada al sistema
    ret                ; Regresar al punto de llamada
