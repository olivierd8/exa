#!/usr/bin/env python3
# coding=UTF-8

#==============================================================================
#titre           :routines.py
#description     :Solutionnaire des exercices sur les routines.
#author          :Louis Marchand
#date            :20140129
#version         :0.1
#usage           :python3 routines.py
#notes           :
#python_version  :3.2.3
#==============================================================================


# ------------------------------- Exercice 1 ---------------------------------#


def aire_carre(a_cote):
    """
        Retourne l'aire d'un carré ayant 'a_cote' comme taille de côté.
        'a_cote' doit être de type entier positif.
    """
    retour = 0
    if isinstance(a_cote, int) and a_cote >= 0:
        retour = a_cote * a_cote
    else:
        raise ValueError
    return retour


# ------------------------------- Exercice 2 ---------------------------------#


def est_liste_entier(a_liste):
    """Retourne Vrai si 'a_liste' est une liste d'entier, Faux sinon."""
    retour = True
    if isinstance(a_liste, list):
        if not all(isinstance(element, int) for element in a_liste):
            retour = False
    else:
        retour = False
    return retour


def minimum(a_liste):
    """
        Retoure la valeur minimum contenue dans 'a_liste'.
        'a_liste' doit être une liste d'entier.
    """
    retour = 0
    if est_liste_entier(a_liste):
        if len(a_liste) == 1:
            retour = a_liste[0]
        else:
            minimum_liste1 = minimum(a_liste[:len(a_liste) // 2])
            minimum_liste2 = minimum(a_liste[len(a_liste) // 2:])
            if minimum_liste1 < minimum_liste2:
                retour = minimum_liste1
            else:
                retour = minimum_liste2
    else:
        raise ValueError
    return retour


# ------------------------------- Exercice 3 ---------------------------------#


def inverser_chaine(a_chaine):
    """
        Retourne une chaîne de caractères contenant les mots de
        'a_chaine' en ordre inverse.
        'a_chaine' doit être une chaîne de caractères.
        'a_chaine' n'est modifiée.
    """
    retour = ""
    if isinstance(a_chaine, str):
        l_separator = " "
        l_mots = a_chaine.split(l_separator)
        l_mots.reverse()
        retour = l_separator.join(l_mots)
    else:
        raise ValueError
    return retour


# ------------------------------- Exercice 4 ---------------------------------#


def fibonacci(a_position):
    """
        Retourne le nombre à la position 'a_position' dans la suite de
        Fibonacci.
        'a_position' doit être  un entier positif.
    """
    if isinstance(a_position, int) and a_position >= 0:
        if a_position == 0 or a_position == 1:
            retour = a_position
        else:
            retour = fibonacci(a_position - 1) + fibonacci(a_position - 2)
    else:
        raise ValueError
    return retour


nombre = fibonacci(13)

# ------------------------------- Exercice 5 ---------------------------------#


def interchanger_liste(a_liste1, a_liste2):
    """
        Interchange le contenue de 'a_liste1' et de 'a_liste2'.
        'a_liste1' et 'a_liste2' doivent être des listes.
    """
    if isinstance(a_liste1, list) and isinstance(a_liste2, list):
        l_listes = [a_liste1, a_liste2]
        l_plus_court = 0
        l_plus_long = 1
        if len(a_liste1) > len(a_liste2):
            l_plus_long = 0
            l_plus_court = 1
        for i in range(len(l_listes[l_plus_court])):
            l_temporaire = a_liste1[i]
            a_liste1[i] = a_liste2[i]
            a_liste2[i] = l_temporaire
        l_count = len(l_listes[l_plus_court])
        for i in range(len(l_listes[l_plus_court]),
                       len(l_listes[l_plus_long])):
            l_listes[l_plus_court].append(l_listes[l_plus_long][l_count])
            l_listes[l_plus_long].pop(l_count)
    else:
        raise ValueError


# ------------------------------- Exercice 6 ---------------------------------#


def argument_vers_liste(*a_arguments):
    """
        Transforme une suite d'arguments en liste.
        'a_arguments' est un tuple représentant à une suite indéfini
        d'arguments.
    """
    print(a_arguments)
    return list(a_arguments)


# ------------------------------- Exercice 7 ---------------------------------#


kelvin_vers_fahrenheit = lambda a_kelvin: ((a_kelvin - 273.15) * 1.8) + 32

kelvin_vers_celsius = lambda a_kelvin: a_kelvin - 273.15


def allo()
    print("Bonjour")

variable = allo()

def convertir_kelvin(a_fonction, a_kelvin):
    """
        Calcul une conversion de à partir du nombre de degré Kelvin 'a_kelvin'
        en fonction de la fonction 'a_fonction'.
        'a_fonction'est une fonction lambda recevant un argument.
        'a_kelvin' est un entier ou on nombre à virgule.
    """
    if callable(a_fonction) and (isinstance(a_kelvin, int) or
                                 isinstance(a_kelvin, float)):
        return a_fonction(a_kelvin)
    else:
        raise ValueError


def test_fibonacci():
    """
        Jeux de tests pour la routine de 'fibonacci'
    """
    is_passed = True
    try:
        fibonacci("Bonjour")
        is_passed = False
        print("Échec du test fibonacci: Type non valide")
    except:
        pass
    try:
        fibonacci(-1)
        is_passed = False
        print("Échec du test fibonacci: Valeur non valide")
    except:
        pass
    l_retour = fibonacci(0)
    if l_retour != 0:
        is_passed = False
        print("Échec du test fibonacci: Valeur 0 (limite)")
    l_retour = fibonacci(9)
    if l_retour != 34:
        is_passed = False
        print("Échec du test fibonacci: Valeur 34 (normale)")
    if is_passed:
        print("Test fibonacci s'est correctement effectué")

test_fibonacci()
