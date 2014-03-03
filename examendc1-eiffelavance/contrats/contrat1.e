note
	description : "contrats application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	CONTRAT1

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			l_temps:TIME
		do
			--| Add your code here
			l_temps:=create {TIME1}.make(10,10,50)
			io.put_string (l_temps.out)
			io.put_new_line

			l_temps:=create {TIME2}.make(23,59,59)
			io.put_string (l_temps.out)
			io.put_new_line

			l_temps:=create {TIME2}.make_from_seconde (86399)
			io.put_string (l_temps.out)
			io.put_new_line
		end

end
