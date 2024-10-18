# Compte-rendu TP3 Félix MIELCAREK

## Exercice 1

1. La ligne 18 copie la valeur entrée sur l'entrée standard (et à l'instant t stocké dans le registre eax) dans l'espace mémoire réservé dans la section de données non-initialisées (input1).
2. La ligne 24 additionne la valeur contenu dans l'espace mémoire correspondant au label input2 avec la valeur contenu dans le registre eax, le résultat se retrouve dans eax.
3. La ligne 29 écrit sur la sortie standard la valeur du résultat de l'addition des deux entiers entrés précédemment. L'addition est à la ligne 24, puis le résultat est enregistré dans le registre ebx à la ligne 25 pour libérer le registre eax utilisé à d'autres fins, ensuite le résultat reviens dans le registre eax à la ligne 28 pour être affiché ligne 29.
4. Ces lignes permettent de terminer le programme en renvoyant un code de retour à 0 (indiquant le succès de l'exécution). Explicitement, la ligne 31 insère le code de retour voulu (0) dans le registre ebx, la ligne 32 insère le numéro correspondant à la fonction système voulu (fin de programme) dans le registre eax, et la ligne 33 exécute la fonction correspondant au numéro inséré dans eax.

## Exercice 2

### 1.

1. Insère la valeur 0xFFFFFFFF dans le registre eax. 
2. Compare la valeur dans le registre eax avec la valeur 0 et modifie les flags en fonction, dans notre exemple l'opération effectué est : 0xFFFFFFFF - 0x0.
3. Regarde si le résultat de l'opération précédente est supérieur strictement à 0 en partant du principe qu'il s'agissait de nombres signés, comme ce n'est pas le cas (0xFFFFFFFF - 0x0 = -1 - 0 = -1) il passe à la ligne d'après.
4. Insère la valeur 0 dans le registre eax.
5. Appelle la fonction print_int de la librairie, cette fonction affiche la valeur de l'entier présente dans le registre eax (0 dans notre cas).
6. Définie une étiquette nommée : aff_1.
7. Insère la valeur 1 dans le registre eax.
8. Appelle la fonction print_int de la librairie, cette fonction affiche la valeur de l'entier présente dans le registre eax (1 dans notre cas).

Résultat de l'éxecution :

> 01

### 2.

1. Insère la valeur 0xFFFFFFFF dans le registre eax. 
2. Compare la valeur dans le registre eax avec la valeur 0 et modifie les flags en fonction, dans notre exemple l'opération effectué est : 0xFFFFFFFF - 0x0.
3. Regarde si le résultat de l'opération précédente est supérieur strictement à 0 en partant du principe qu'il s'agissait de nombres non-signés, comme c'est le cas (0xFFFFFFFF - 0x0 = 0xFFFFFFFF) il saute à l'étiquette indiquée : aff_1.
4. **[Ne sera pas exécuté]** Insère la valeur 0 dans le registre eax.
5. **[Ne sera pas exécuté]** Appelle la fonction print_int de la librairie, cette fonction affiche la valeur de l'entier présente dans le registre eax.
6. Définie une étiquette nommée : aff_1.
7. Insère la valeur 1 dans le registre eax.
8. Appelle la fonction print_int de la librairie, cette fonction affiche la valeur de l'entier présente dans le registre eax (1 dans notre cas).

Résultat de l'éxecution :

> 1

## Exercice 4


