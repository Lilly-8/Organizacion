section .data
num1 db 5             ; Declarar un byte con el valor 5
num2 db 11            ; Declarar un byte con el valor 11
result db 0           ; Declarar un byte inicializado en 0 para almacenar el resultado
msg db 'Resultado: ', 0 ; Cadena de texto que se imprimirá antes del resultado

section .bss
buffer resb 4         ; Reserva 4 bytes sin inicializar para el buffer de salida

section .text
global _start          ; Declarar el punto de inicio del programa

_start:
    mov al, [num1]     ; Cargar el valor de 'num1' en el registro AL
    add al, [num2]     ; Sumar el valor de 'num2' al registro AL
    mov [result], al   ; Guardar el resultado en la variable 'result'

    ; Convertir el resultado numérico a su representación ASCII
    movzx eax, byte [result] ; Cargar 'result' en EAX extendiendo a 32 bits con ceros
    add eax, 48       ; Ajustar el valor para convertirlo a su representación ASCII ('0' = 48)
    mov [buffer], al  ; Guardar el carácter ASCII en el buffer

    ; Imprimir el mensaje "Resultado: "
    mov eax, 4        ; Llamada al sistema para escribir
    mov ebx, 1        ; Descriptor del archivo: 1 (stdout)
    mov ecx, msg      ; Dirección del mensaje
    mov edx, 11       ; Longitud del mensaje
    int 0x80          ; Interrupción para invocar la llamada al sistema

    ; Imprimir el carácter ASCII del resultado
    mov eax, 4        ; Llamada al sistema para escribir
    mov ebx, 1        ; Descriptor del archivo: 1 (stdout)
    mov ecx, buffer   ; Dirección del buffer que contiene el resultado ASCII
    mov edx, 1        ; Longitud del carácter a imprimir
    int 0x80          ; Interrupción para invocar la llamada al sistema

    ; Salir del programa
    mov eax, 1        ; Llamada al sistema para salir
    xor ebx, ebx      ; Código de salida 0
    int 0x80          ; Interrupción para finalizar el programa


