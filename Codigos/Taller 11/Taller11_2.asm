section .data
    message db "La suma de los valores es: ", 0 ; Mensaje inicial
    newline db 10, 0                            ; Nueva línea para la salida

section .bss
    buffer resb 5                               ; Buffer para convertir números a caracteres (4 dígitos + terminador)

section .text
    global _start

; Macro para definir una estructura con tres valores
%macro DEFINE_VALUES 3
    val1 db %1                ; Primer valor
    val2 db %2                ; Segundo valor
    val3 db %3                ; Tercer valor
%endmacro

; Macro para imprimir una cadena
%macro PRINT_STRING 1
    mov eax, 4                 ; Syscall número para 'write'
    mov ebx, 1                 ; File descriptor para stdout
    mov ecx, %1                ; Dirección del mensaje
    mov edx, 25                ; Longitud del mensaje (ajusta según el texto)
    int 0x80
%endmacro

; Macro para convertir y imprimir un número
%macro PRINT_NUMBER 1
    mov eax, %1                ; Carga el número a imprimir en EAX
    xor ecx, ecx               ; Limpia ECX para usarlo como índice
    mov edi, buffer + 4        ; Apunta al final del buffer
    mov ebx, 10                ; Divisor para obtener dígitos decimales

.next_digit:
    xor edx, edx               ; Limpia EDX antes de la división
    div ebx                    ; Divide EAX entre 10 (cociente en EAX, residuo en EDX)
    add dl, '0'                ; Convierte el residuo (dígito) a ASCII
    dec edi                    ; Mueve el puntero hacia atrás en el buffer
    mov [edi], dl              ; Almacena el dígito en el buffer
    inc ecx                    ; Incrementa el conteo de dígitos
    test eax, eax              ; Verifica si quedan dígitos
    jnz .next_digit            ; Si hay más dígitos, continúa

    ; Imprime el número
    mov eax, 4                 ; Syscall para 'write'
    mov ebx, 1                 ; Salida estándar
    mov ecx, edi               ; Apunta al primer dígito
    mov edx, ecx               ; Calcula la longitud del número
    sub edx, buffer + 4
    neg edx                    ; Convierte el valor negativo a positivo
    int 0x80
%endmacro

; Macro para realizar la suma e imprimir el resultado
%macro PRINT_SUM 0
    movzx eax, byte [val1]     ; Carga el primer valor en EAX (extensión sin signo)
    movzx ebx, byte [val2]     ; Carga el segundo valor en EBX
    movzx ecx, byte [val3]     ; Carga el tercer valor en ECX
    add eax, ebx               ; Suma el segundo valor
    add eax, ecx               ; Suma el tercer valor

    PRINT_NUMBER eax           ; Imprime el resultado
    PRINT_STRING newline       ; Imprime una nueva línea
%endmacro

; Definir valores usando la macro
DEFINE_VALUES 3, 5, 7          ; Valores: 3, 5 y 7

_start:
    ; Imprime el mensaje inicial
    PRINT_STRING message
    PRINT_STRING newline       ; Añade una nueva línea después del mensaje

    ; Imprime la suma de los valores
    PRINT_SUM

    ; Salir del programa
    mov eax, 1                 ; Syscall para 'exit'
    mov ebx, 0                 ; Código de salida
    int 0x80

