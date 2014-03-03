note
	description: "Summary description for {EX_SANS_CONFLIT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EX_SANS_CONFLIT

inherit
	THREAD
	rename
		make as make_thread
	end

create
	make

feature {NONE} -- Initialization

	make
		do
			make_thread
			create mon_mutex.make
		end

feature -- Access

	divise(a_nombre:INTEGER):INTEGER
	do

		mon_mutex.lock
		if diviseur=0 then
			result:=0
		else
			result:=a_nombre//diviseur
		end
		mon_mutex.unlock
	end

	stop_thread
		do
			must_stop := true
		end

feature {NONE}

	must_stop: BOOLEAN

	diviseur:INTEGER

	mon_mutex:MUTEX

	execute
	do
		from must_stop:=false
		until must_stop
		loop
			mon_mutex.lock
			diviseur:=(diviseur+1)\\5
			mon_mutex.unlock
		end
	end

end
