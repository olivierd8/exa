#!/usr/bin/env python3
# coding=UTF-8

#==============================================================================
# titre           :trir.py
# description     :Solutionnaire des exercices sur les tris.
# author          :Louis Marchand
# date            :20140129
# version         :0.1
# usage           :python3 tri.py
# notes           :
# python_version  :3.2.3
#==============================================================================


def est_liste_entier(a_liste):
    """Retourne Vrai si 'a_liste' est une liste d'entier, Faux sinon."""
    retour = True
    if isinstance(a_liste, list):
        if not all(isinstance(element, int) for element in a_liste):
            retour = False
    else:
        retour = False
    return retour


def tri_bulle(a_liste):
    """
        Tri la liste 'a_liste' sur place.
        'a_liste' doit être une liste d'entier.
        L'algorythme de tri-bulle est utilisé.
    """
    if est_liste_entier(a_liste):
        for i in reversed(range(1, len(a_liste))):
            for j in range(i):
                if a_liste[j] > a_liste[j + 1]:
                    l_temporaire = a_liste[j]
                    a_liste[j] = a_liste[j + 1]
                    a_liste[j + 1] = l_temporaire
    else:
        raise ValueError


def tri_insertion(a_liste):
    """
        Tri la liste 'a_liste' sur place.
                'a_liste' doit être une liste d'entier.
                L'algorythme de tri-insertion est utilisé.
    """
    if est_liste_entier(a_liste):
        for i in range(1, len(a_liste)):
            l_element = a_liste[i]
            a_liste.pop(i)
            j = 0
            while j < i and a_liste[j] < l_element:
                j = j + 1
            a_liste.insert(j, l_element)
    else:
        raise ValueError
