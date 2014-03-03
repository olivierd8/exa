note
	description: "Summary description for {EX_CONFLIT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EX_CONFLIT

inherit
	THREAD

create
	make

feature -- Access

	stop_thread
		do
			must_stop := true
		end

	divise(a_nombre:INTEGER):INTEGER
	do
		if diviseur=0 then
			result:=0
		else
			result:=a_nombre//diviseur
		end
	end

feature {NONE}

	must_stop: BOOLEAN

	diviseur:INTEGER

	execute
	do
		from must_stop:=false
		until must_stop
		loop
			diviseur:=(diviseur+1)\\5
		end
	end

end
