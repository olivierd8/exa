note
	description: "Summary description for {CLASSE_PARENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class  -- Classe abstraite
	CLASSE_PARENT

inherit
	ANY

feature -- Access

	get_longueur_total:INTEGER -- Contrairement aux classe abstraite d'autre langage, la classe deferred peut effectuer du traitement
			-- Somme des deux longueurs
		do
			Result:=get_longueur_1+get_longueur_2
		end

	get_longueur_1:INTEGER -- Methode qui devra etre implementee dans les classes enfants
			-- La premiere longueur
		deferred
		end

	get_longueur_2:INTEGER -- Methode qui devra etre implementee dans les classes enfants
			-- La seconde longueur
		deferred
		end

	is_a:BOOLEAN
			-- l'objet est de type A
		deferred
		end

	is_b:BOOLEAN
			-- l'objet est de type B
		deferred
		end

feature -- Propriete

		-- Sans assigner, les proprietes sont en lecture seule
	titre:STRING assign put_titre
			-- Titre de l'objet.

feature {NONE} -- Implementation

	put_titre(a_titre:STRING)
			-- Assigne la valeur `a_titre' a `titre'.
		do
			titre:=a_titre
		end


end
