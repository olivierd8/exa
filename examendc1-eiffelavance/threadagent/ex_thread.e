note
	description: "Summary description for {EX_THREAD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EX_THREAD

inherit
	THREAD
	rename
		make as make_thread
	end

create
	make

feature {NONE} -- Initialization

	make (chaine: STRING)
		do
			make_thread
			must_stop := false
			chaine_affiche := chaine
		end

feature -- Access

	stop_thread
		do
			must_stop := true
		end

feature {NONE} -- Thread methods

	execute
		do
			from
			until
				must_stop
			loop
				io.put_string (chaine_affiche)
				io.output.flush
			end
		end

feature {NONE} -- Implementation

	must_stop: BOOLEAN

	chaine_affiche: STRING

end
