; Auteurs : Nermine KILANI - Félix MIELCAREK 
; Date de creation : 08/10/2024
; Objectif : ---

%include "asm_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;; Section de donnees ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data
askInt: db 'Enter number: ',0
printRes: db 'Max is: ',0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;; Section de reservation ;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .bss
int1: resd 1
int2: resd 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;; Section de code ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
global main
main:
	mov eax, askInt
	call print_string
	call read_int
	mov [int1], eax
	
	mov eax, askInt
	call print_string
	call read_int
	mov [int2], eax

	mov eax, printRes
	call print_string
	
	mov ebx, [int1]
	cmp ebx, [int2]
	jg else
		mov eax, [int2]
		call print_int
		jmp endif
	else:
		mov eax, ebx
		call print_int
		jmp endif
	endif:


    ; Fin de l'execution.
    mov ebx, 0
    mov eax, 1
    int 0x80



