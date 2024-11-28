section .data
    msgInput db "Ingresa un numero: ", 0
    msgOutput db "El resultado es: ", 0
    newline db 0xA, 0
    buffer db 0

section .text
    global _start

_start:
    ; Mostrar mensaje para ingresar un número
    mov eax, 4              ; syscall: sys_write
    mov ebx, 1              ; file descriptor: stdout
    mov ecx, msgInput       ; mensaje para el usuario
    mov edx, 18             ; longitud del mensaje
    int 0x80

    ; Leer el número ingresado
    mov eax, 3              ; syscall: sys_read
    mov ebx, 0              ; file descriptor: stdin
    mov ecx, buffer         ; almacenar en buffer
    mov edx, 1              ; leer un carácter
    int 0x80

    ; Incrementar el número (asumiendo entrada válida)
    mov al, [buffer]        ; cargar carácter en AL
    sub al, '0'             ; convertir ASCII a entero
    add al, 1               ; incrementar en 1
    add al, '0'             ; convertir entero a ASCII
    mov [buffer], al        ; guardar resultado en buffer

    ; Mostrar mensaje del resultado
    mov eax, 4              ; syscall: sys_write
    mov ebx, 1              ; file descriptor: stdout
    mov ecx, msgOutput      ; mensaje de salida
    mov edx, 18             ; longitud del mensaje
    int 0x80

    ; Mostrar resultado
    mov eax, 4              ; syscall: sys_write
    mov ebx, 1              ; file descriptor: stdout
    mov ecx, buffer         ; dirección del resultado
    mov edx, 1              ; longitud del resultado
    int 0x80

    ; Nueva línea
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Salir del programa
    mov eax, 1              ; syscall: sys_exit
    xor ebx, ebx            ; código de salida 0
    int 0x80

