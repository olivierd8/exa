note
	description : "Exemple pour montrer les classes."
	date        : "$Date$"
	revision    : "$Revision$"

class
	LESCLASSES

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application
		local
			l_a1,l_a2,l_a3:CLASSE_A
			l_b1,l_b2:CLASSE_B
			l_c1:CLASSE_C
			l_classes:LIST[CLASSE_PARENT]
		do
			create {ARRAYED_LIST[CLASSE_PARENT]} l_classes.make (5)

			create l_a1.make
			l_a1.titre:="A1"
			l_a1.longueur_1:=10
			l_a1.longueur_2:=20
			l_classes.extend (l_a1)

			create l_a2.make
			l_a2.titre:="A2"
			l_a2.longueur_1:=30
			l_a2.longueur_2:=40
			l_classes.extend (l_a2)

			create l_a3.make
			l_a3.titre:="A3"
			l_a3.longueur_1:=50
			l_a3.longueur_2:=60
			l_classes.extend (l_a3)


			create l_b1.make
			l_b1.titre:="B1"
			l_classes.extend (l_b1)

			create l_b2.make_from_value (5,6,7,8)
			l_b2.titre:="B2"
			l_classes.extend (l_b2)


			create l_c1.make
			l_c1.titre:="C1"
			l_classes.extend (l_c1)

			afficher_liste_classe(l_classes)
			affiche_titre_classe_a(l_classes)
			affiche_titre_classe_b(l_classes)

		end

	afficher_info_liste_classe_a(a_classes:ITERABLE[CLASSE_PARENT])
			-- Affiche si la liste contient des éléments de type A.
		local
			l_has_a, l_all_a:BOOLEAN
		do
			print("Affiche les infos pour la classe A.%N")
			l_has_a := across a_classes as l_classes some l_classes.item.is_a end
			if l_has_a then
				l_all_a := across a_classes as l_classes all l_classes.item.is_a end
				if l_all_a then
					print("La liste contient uniquement des objets de type A.%N")
				else
					print("La liste contient des objets de type A.%N")
				end
			else
				print("La liste ne contient aucun des objets de type A.%N")
			end
		end

	afficher_liste_classe(a_classes:ITERABLE[CLASSE_PARENT])
			-- Affiche les elements de la liste.
		do
			print("Tous les titres.%N")
			across a_classes as l_classes loop
				print(l_classes.item.titre+" de longueur "+l_classes.item.get_longueur_total.out+".%N")
			end
		end

	affiche_titre_classe_a(a_classes:SEQUENCE[CLASSE_PARENT])
			-- Affiche les elements de type A.
		do
			print("Les titres des classes A.%N")
			from a_classes.start
			until a_classes.exhausted
			loop
				if a_classes.item.is_a then
					print(a_classes.item.titre+" de longueur "+a_classes.item.get_longueur_total.out+".%N")
				end
				a_classes.forth
			end
		end

	affiche_titre_classe_b(a_classes:SEQUENCE[CLASSE_PARENT])
			-- Affiche les elements de type B.
		do
			print("Les titres des classes B.%N")
			from a_classes.start
			until a_classes.exhausted
			loop
				if attached {CLASSE_B} a_classes.item as l_b then
					print(l_b.titre+" de longueur "+l_b.get_longueur_total.out+".%N")
				end
				a_classes.forth
			end

		end

end
