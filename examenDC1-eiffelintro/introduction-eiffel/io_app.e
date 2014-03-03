note
	description : "Application pour demontrer l'utilisation des entrees/sorties console"
	date        : "$Date$"
	revision    : "$Revision$"

class
	IO_APP

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			io.put_string ("Entrez votre nom: ")
			io.read_line
			io.put_string ("Entrez votre age: ")
			io.read_integer_8
			io.print ("Bonjour "+io.last_string+", vous avez "+io.last_integer_8.out+" ans.%N")
		end

end
