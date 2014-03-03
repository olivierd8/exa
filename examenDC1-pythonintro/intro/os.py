from os import *
fichier = input("Veuillez entrer un nom de fichier: ")
    # Si l'usager a entre un ~ pour representer le repertoire de
    # l'utilisateur, path.expanduser retournera le chemin complet
fichieruser = path.expanduser(fichier)

fichierfinal = path.abspath(fichieruser)

if(path.exists(fichierfinal)):
    print("Le fichier existe.")
    print("Le chemin absolu du fichier est: " + fichierfinal)
    print("Le chemin relatif du ficher est: " + path.relpath(fichierfinal))
    print("Le nom du fichier: " + path.basename(fichierfinal))
    print("Le repertoire contenant le fichier: " + path.dirname(fichierfinal))
    print("L'extension du fichier: " + path.splitext(fichierfinal)[1])
    print("Le taille du fichier: " + str(path.getsize(fichierfinal)) +
          " octets.")
    if (path.isdir(fichierfinal)):
        print("Le fichier est un repertoire.")
    if (path.islink(fichierfinal)):
        print("Le fichier est un lien symbolique.")
else:
    print("Le fichier specifie n'existe pas!")
