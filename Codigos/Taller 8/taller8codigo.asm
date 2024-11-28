section .data
    msg db 'Resultado: ', 0  
    newline db 0xA           

section .bss
    res resb 4                 ; Espacio para el resultado

section .text
    global _start

_start:

    ; Instrucciones aritméticas
    mov eax, 10       
    mov ebx, 5      
    add eax, ebx      

    ; Instrucción lógica (AND)
    and eax, 0xF      

    ; Instrucciones de manipulación de bits
    shl eax, 1       

    ; Guardar el resultado en la sección .bss
    mov [res], eax   

    ; Llamar a la rutina para imprimir el resultado
    mov eax, 4        ; Syscall para escribir
    mov ebx, 1        ; Usar la salida estándar (pantalla)
    mov ecx, msg      ; Direccion del mensaje a imprimir
    mov edx, 11       ; Longitud del mensaje
    int 0x80          ; Interrupción para imprimir el mensaje

    ; Imprimir el número (resultado almacenado en 'res')
    mov eax, [res]    ; Cargar el resultado en EAX
    add eax, '0'      ; Convertir el número en carácter (ASCII)
    mov [res], eax    ; Almacenar el carácter convertido
    mov eax, 4        ; Syscall para escribir
    mov ebx, 1        ; Usar la salida estándar
    mov ecx, res      ; Dirección del resultado
    mov edx, 1        ; Longitud de 1 carácter
    int 0x80          ; Interrupción para imprimir el número

    ; Imprimir nueva línea
    mov eax, 4        ; Syscall para escribir
    mov ebx, 1        ; Usar la salida estándar
    mov ecx, newline  ; Dirección de la nueva línea
    mov edx, 1        ; Longitud de 1 carácter
    int 0x80          ; Interrupción para imprimir nueva línea

    ; Terminar el programa
    mov eax, 1        ; Syscall para salir
    xor ebx, ebx      ; Código de salida 0
    int 0x80          ; Interrupción para terminar el programa