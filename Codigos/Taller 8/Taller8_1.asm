section .data
msg db 'Resultado: ', 0 ; Mensaje inicial
newline db 0xA          ; Nueva línea
section .bss
res resb 4              ; Espacio para el resultado
section .text
global _start
_start:
    ; 1. Imprimir 'l' (ele minúscula)
    mov eax, 108        ; Cargar el valor ASCII de 'l' (108 en decimal) en EAX
    mov [res], eax      ; Guardar en la sección reservada
    call print_char     ; Llamar a la rutina para imprimir el carácter

    ; 2. Imprimir 'D'
    mov eax, 68         ; Cargar el valor ASCII de 'D' (68 en decimal)
    mov [res], eax      ; Guardar el resultado en la sección reservada
    call print_char     ; Llamar a la rutina para imprimir el carácter

    ; 3. Imprimir 'B'
    mov eax, 66         ; Cargar el valor ASCII de 'B' (66 en decimal)
    mov [res], eax      ; Guardar el resultado
    call print_char     ; Llamar a la rutina para imprimir el carácter

    ; 4. Imprimir '4'
    mov eax, 2          ; Cargar el valor 2 en EAX
    shl eax, 1          ; Multiplicar EAX por 2 (2 << 1 = 4)
    add eax, 48         ; Convertir el valor a su representación ASCII ('0' = 48)
    mov [res], eax      ; Guardar el carácter en la sección reservada
    call print_char     ; Llamar a la rutina para imprimir el carácter

    ; 5. Imprimir '2'
    mov eax, 4          ; Cargar el valor 4 en EAX
    shr eax, 1          ; Dividir el valor entre 2 (4 >> 1 = 2)
    add eax, 48         ; Convertir a su representación ASCII ('0' = 48)
    mov [res], eax      ; Guardar el carácter
    call print_char     ; Llamar a la rutina para imprimir el carácter

    ; Terminar el programa
    mov eax, 1          ; Syscall para salir
    xor ebx, ebx        ; Código de salida 0
    int 0x80            ; Interrupción para terminar el programa

; Subrutina para imprimir un carácter
print_char:
    mov eax, 4          ; Syscall para escribir
    mov ebx, 1          ; Usar la salida estándar (pantalla)
    mov ecx, res        ; Dirección del carácter a imprimir
    mov edx, 1          ; Longitud de 1 carácter
    int 0x80            ; Interrupción para escribir el carácter
    ret                 ; Regresar al punto de llamada
