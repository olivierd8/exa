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


def tri_fusion(a_liste):
    """
        Effectuer un tri sur 'a_liste'.
        'a_liste' est une liste de nombre.
        L'algorithme utilisé est le tri-fusion.
    """

    if est_liste_entier(a_liste):
        if len(a_liste) < 2:
            retour = a_liste
        else:
            l_sous_liste1 = tri_fusion(a_liste[:len(a_liste) // 2])
            l_sous_liste2 = tri_fusion(a_liste[len(a_liste) // 2:])
            retour = []
            i = 0
            j = 0
            while i < len(l_sous_liste1) and j < len(l_sous_liste2):
                if l_sous_liste1[i] < l_sous_liste2[j]:
                    retour.append(l_sous_liste1[i])
                    i = i + 1
                else:
                    retour.append(l_sous_liste2[j])
                    j = j + 1
            retour.extend(l_sous_liste1[i:])
            retour.extend(l_sous_liste2[j:])
    else:
        raise ValueError
    return retour


def tri_rapide(a_liste, a_debut=0, a_taille=-1):
    """
        Effectuer un tri sur 'a_liste'.
        'a_liste' est une liste de nombre.
        L'algorithme utilisé est le tri-rapide.
    """
    if est_liste_entier(a_liste) and ((a_taille == -1 and a_debut == 0) or
                                      (a_taille >= 0 and a_debut >= 0 and
                                       a_debut + a_taille <= len(a_liste))):
        if a_taille < 0:
            tri_rapide(a_liste, a_debut, len(a_liste))
        elif a_taille > 1:
            l_pivot = a_debut
            for i in range(a_debut + 1, a_debut + a_taille):
                if a_liste[i] < a_liste[l_pivot]:
                    l_element = a_liste.pop(i)
                    a_liste.insert(l_pivot, l_element)
                    l_pivot = l_pivot + 1
            tri_rapide(a_liste, a_debut, l_pivot - a_debut)
            tri_rapide(a_liste, l_pivot + 1, a_taille + a_debut - l_pivot - 1)
    else:
        raise ValueError
