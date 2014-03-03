note
	description: "Summary description for {CONTRAT2}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CONTRAT2

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization for `Current'.
		local
			l_res1:REAL_32
			l_res2,l_res3:INTEGER
		do
			l_res1:=contrat_check
			io.put_real (l_res1)
			io.put_new_line
			l_res2:=loop_sans_contrat(15,3)
			io.put_integer (l_res2)
			io.put_new_line
			l_res3:=loop_avec_contrat(24,8)
			io.put_integer (l_res3)
			io.put_new_line

		end

	contrat_check:REAL_32
		local
			l_valeur:INTEGER
		do
			io.put_string ("Entre une valeur: ")
			io.read_integer_32
			l_valeur:=io.last_integer_32
			check
				valeur_non_zero: l_valeur /= 0
			end
			result:=(100.0/l_valeur).truncated_to_real
		end

	loop_sans_contrat(a_nombre, a_diviseur:INTEGER):INTEGER -- Effectue une division entiere
		local
			l_reste:INTEGER
		do
			result:=0
			from
				l_reste:=a_nombre
			until
				l_reste<a_diviseur
			loop
				l_reste:=l_reste-a_diviseur
				result:=result+1
			end
		end

	loop_avec_contrat(a_nombre, a_diviseur:INTEGER):INTEGER -- Effectue une division entiere
		local
			l_reste:INTEGER
		do
			result:=0
			from
				l_reste:=a_nombre
			invariant
				reversible: a_nombre=result*a_diviseur+l_reste
			until
				l_reste<a_diviseur
			loop
				l_reste:=l_reste-a_diviseur
				result:=result+1
			variant
				reste_diminue: l_reste
			end
		end

end
