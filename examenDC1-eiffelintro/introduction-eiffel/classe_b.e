note
	description: "Summary description for {CLASSE_B}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CLASSE_B

inherit
	CLASSE_PARENT

create
	make,
	make_from_value

feature {NONE} -- Initialization

	make
			-- Valeur par defaut pour les longueurs
		do
			longueur_1_1:=10
			longueur_1_2:=20
			longueur_2_1:=30
			longueur_2_2:=40
		end

	make_from_value(la_longueur_1_1,la_longueur_1_2,la_longueur_2_1,la_longueur_2_2:INTEGER)
			-- Valeur par defaut pour les longueurs
		do
			longueur_1_1:=la_longueur_1_1
			longueur_1_2:=la_longueur_1_2
			longueur_2_1:=la_longueur_2_1
			longueur_2_2:=la_longueur_2_2
		end

feature -- Proprietes

	longueur_1_1:INTEGER
			-- Partie 1 de la longueur 1
	longueur_1_2:INTEGER
			-- Partie 2 de la longueur 1
	longueur_2_1:INTEGER
			-- Partie 1 de la longueur 2
	longueur_2_2:INTEGER
			-- Partie 2 de la longueur 2


feature -- Access

	get_longueur_1:INTEGER
			-- <Precursor>
		do
			Result:=longueur_1_1+longueur_1_2
		end

	get_longueur_2:INTEGER
			-- <Precursor>
		do
			Result:=longueur_2_1+longueur_2_2
		end

	is_a: BOOLEAN = false
			-- <Precursor>

	is_b: BOOLEAN = true
			-- <Precursor>

end
