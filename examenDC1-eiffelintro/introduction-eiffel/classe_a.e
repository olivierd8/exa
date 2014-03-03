note
	description: "Summary description for {CLASSE_A}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CLASSE_A

inherit
	CLASSE_PARENT

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization for `Current'.
		do
			default_create
		end


feature -- proprietes

	longueur_1:INTEGER assign put_longueur_1
			-- La longueur 1
	longueur_2:INTEGER assign put_longueur_2
			-- La longueur 1

feature -- Access

	get_longueur_1:INTEGER
			-- <Precursor>
		do
			Result:=longueur_1
		end

	get_longueur_2:INTEGER
			-- <Precursor>
		do
			Result:=longueur_2
		end

		-- Declaration d'une constante
	is_a: BOOLEAN = true
			-- <Precursor>

	is_b: BOOLEAN = false
			-- <Precursor>

feature {NONE} -- Implementation

	put_longueur_2(a_longueur:INTEGER)
			-- Assigner la valeur `a_longueur' a `longueur_2'
		do
			longueur_2:=a_longueur
		end

	put_longueur_1(a_longueur:INTEGER)
			-- Assigner la valeur `a_longueur' a `longueur_1'
		do
			longueur_1:=a_longueur
		end

end
