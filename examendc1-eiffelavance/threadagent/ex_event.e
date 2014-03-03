note
	description: "Summary description for {EX_EVENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EX_EVENT

inherit
	THREAD
	rename
		make as make_thread
	end

create
	make

feature {NONE} -- Initialization

	make(a_quit_procedure:ROUTINE[ANY,TUPLE])
			-- Initialization for `Current'.
		do
			make_thread
			quit_procedure:=a_quit_procedure
		end

feature {NONE}

	execute
	local
		quit:BOOLEAN
	do
		from quit:=false
		until quit
		loop
			io.read_character
			if io.last_character='0' then
				quit:=true
				quit_procedure.call ([])
			end
		end

	end

feature {NONE} -- Implementation

	quit_procedure:ROUTINE[ANY,TUPLE]

end
