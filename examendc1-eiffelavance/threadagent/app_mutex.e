note
	description : "project application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APP_MUTEX

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			l_quit_handeler:EX_EVENT
			l_conflit:EX_SANS_CONFLIT -- Changer la classe pour EX_SANS_CONFLIT pour voir la version fonctionnelle avec mutex
		do
			create l_conflit.make
			create l_quit_handeler.make (agent do quit:=true end)
			l_quit_handeler.launch
			from
				quit:=false
				l_conflit.launch
			until quit
			loop
				io.put_integer (l_conflit.divise (5))
			end
			l_conflit.stop_thread
			l_conflit.join
			l_quit_handeler.join
			io.put_new_line
		end

feature {NONE}

	quit:BOOLEAN

end
