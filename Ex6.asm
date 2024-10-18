; Auteurs : Nermine KILANI - Félix MIELCAREK 
; Date de creation : 08/10/2024
; Objectif : ---

%include "asm_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;; Section de donnees ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data
space: db ' ',0
askInt: db 'Enter int: ',0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;; Section de reservation ;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .bss
int1: resd 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;; Section de code ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
global main
main:
	; Ask for number and store it
	mov eax, askInt
	call print_string
	call read_int
	mov [int1], eax
	
	mov ebx, 0	; Init divider

	if:
		mov eax, [int1]
		add ebx, 1	; Add 1 to divider
		cmp eax, ebx	; Compare input to divider
		jb endif	; If divider > input, end loop
		
		mov edx, 0 	; Init MSB
		div ebx		; Divide input by divider
		cmp edx, 0	; Compare rest to 0
		jne if		; If not equal, continue loop
		mov eax, ebx	
		call print_int	; Else, print divider
		mov eax, space
		call print_string
		jmp if
	endif:

    ; Fin de l'execution.
    mov ebx, 0
    mov eax, 1
    int 0x80



