note
	description : "Exemple pour montrer les parametres, les conditions, les boucles et les fonctions."
	date        : "$Date$"
	revision    : "$Revision$"

class
	ARG_IF_LOOP

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application
		local
			l_nb,l_total:INTEGER
		do
			if argument_count<1 then
				l_nb:=100
			else
				if argument (1).is_integer then
					l_nb:=argument (1).to_integer
				else
					print("Le nombre est invalide. Le nombre 100 est utilise!%N")
					l_nb:=100
				end
			end
			l_total:=calcul_total(l_nb)
			print ("Le total est: "+l_total.out+".%N")
		end

	calcul_total(a_nb:INTEGER):INTEGER
			-- Calcul le total des nombres entres.
		local
			l_i:INTEGER
		do
			Result:=0
			from l_i:=1                 -- Initialisation de la boucle. Laisser vide si non necessaire (ex. boucle While)
			until l_i>a_nb                -- Jusqu'a ce que... (et non tant que comme dans les autres langages)
			loop
				result:=result+l_i
				l_i:=l_i+1
			end
		end


end
