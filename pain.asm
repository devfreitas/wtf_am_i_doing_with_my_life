section .data
    msg_boas_vindas db 'Bem-vindo a Calculadora Simples em Assembly!', 0ah, 0dh, '$'
    msg_primeiro_num db 'Digite o primeiro numero (0-9): ', '$'
    msg_segundo_num  db 'Digite o segundo numero (0-9): ', '$'
    msg_resultado    db 'O resultado da soma e: ', '$'
    
section .bss
    num1 resb 1
    num2 resb 1
    soma resb 1


section .text
    global _start

_start:
    mov ah, 09h
    mov dx, msg_boas_vindas
    int 21h

    mov ah, 09h
    mov dx, msg_primeiro_num
    int 21h

    mov ah, 01h
    int 21h
    mov [num1], al

    mov ah, 09h
    mov dx, msg_segundo_num
    int 21h

    mov ah, 01h
    int 21h
    mov [num2], al

    mov al, [num1]
    sub al, '0'
    mov bl, [num2]
    sub bl, '0'

    add al, bl

    add al, '0'
    mov [soma], al

    mov ah, 09h
    mov dx, msg_resultado
    int 21h
    
    mov ah, 02h
    mov dl, [soma]
    int 21h
    
    mov ah, 0ah
    int 21h
    mov ah, 0dh
    int 21h

    mov ah, 4ch
    int 21h

    
