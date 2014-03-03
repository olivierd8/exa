note
	description: "Summary description for {CLASSE_C}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CLASSE_C

inherit
	CLASSE_A
	rename					-- Puisque is_b de CLASSE_A est faux et que CLASSE_B est egalement
		is_b as is_not_b	-- de CLASSE_B (polymorphisme), donc on change le nom de is_b
	undefine
		get_longueur_2 -- get_longueur_1 sera celui de CLASSE_A
	redefine
		make	-- On va reecrire la methode make
	select		-- Si un objet de type CLASSE_PARENT contient un objet de type CLASSE_C
		is_a	-- donc le is_a sera celui de CLASSE_A
	end

	CLASSE_B
	rename
		is_a as is_not_a
	undefine
		get_longueur_1 -- get_longueur_2 sera celui de CLASSE_B
	redefine
		make
	select
		is_b
	end

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization for `Current'.
		do
			default_create
			longueur_1:=100
			longueur_2_1:=200
			longueur_2_2:=300
		end

end
