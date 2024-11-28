section .data
    num1 db 5            
    num2 db 11           
    result db 0          
    message db "Resultado: ", 0   

section .bss
    buffer resb 4        

section .text
    global _start

%macro PRINT_STRING 1
    mov eax, 4           
    mov ebx, 1           
    mov ecx, %1          
    mov edx, 13          
    int 0x80
%endmacro

%macro PRINT_NUMBER 1
    mov eax, %1          
    add eax, '0'         
    mov [buffer], eax    
    mov eax, 4           
    mov ebx, 1           
    mov ecx, buffer      
    mov edx, 1           
    int 0x80
%endmacro

_start:
    mov al, [num1]    ;Carga el primer numero
    add al, [num2]    ;Carga el segundo numero
    mov [result], al  ;Guarda el resultado

    PRINT_STRING message  
    PRINT_NUMBER [result] 

    ; Salir del programa
    mov eax, 1           
    mov ebx, 0           
    int 0x80

