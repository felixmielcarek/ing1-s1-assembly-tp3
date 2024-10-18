; Auteurs : ---
; Date de creation : ---
; Objectif : ---

%include "asm_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;; Section de donnees ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data
prompt1 : db "Entrer une suite d'entiers entre 0 et 50 : ", 0
spc : db " ", 0
list : times 51 db 0             ; reserve 51 bytes of space initilaized 
                                       ;to 0 (0, 0, 0 , ... ) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;; Section de reservation ;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .bss

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;; Section de code ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
global main
main:

    mov eax, prompt1                ; Charger l'adresse du prompt dans eax
    call print_string               ; Appeler print_string pour afficher le prompt

    ; Lire  chaque entrée de l'utilisateur
    
    mov ebx, -1                     ; condition d'arret de while loop

    ; stockage des entiers entrée dans list

    while:
    	call read_int		; Lire un entier et le stocker dans eax

        cmp eax, ebx
        je end_while

        mov byte[list + eax], 1     ; si l'entier est entrée, list[entier] sera 1
                                    ; sinon elle contient 0 par défaut
                                    ; example , on entre 5 donc list[5] = 1
	jmp while
    end_while:

    ; for loop pour afficher les nombres non vue ordre croissant
        mov ecx, 0                   ; indice du for
        mov ebx, 51                  ; condition d'arret du for (ecx = 50)
        mov dl , 1                 
        for:
	    cmp ecx, ebx            
            je end_for

            mov al, [list + ecx]
	    
            cmp al, dl            ; check if valeur entrée correspond à 1 dans list
            je next_loop

            mov eax, ecx
            call print_int
	    mov eax, spc
	    call print_string
	    
            next_loop: 
                add ecx, 1
                jmp for
        end_for:
            call print_nl  



    ; Fin de l'execution.
    mov ebx, 0
    mov eax, 1
    int 0x80

