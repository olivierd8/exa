note
	description: "Summary description for {TIME1}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TIME1

inherit
	TIME
create
	make

feature {NONE} -- Assigner



	set_heure(a_heure:NATURAL_8)
	do
		i_heure:=a_heure
	end

	set_minute(a_minute:NATURAL_8)
	do
		i_minute:=a_minute
	end

	set_seconde(a_seconde:NATURAL_8)
	do
		i_seconde:=a_seconde
	end

feature {ANY} -- Access

	heure:NATURAL_8
	do
		result:=i_heure
	end

	minute:NATURAL_8
	do
		result:=i_minute
	end

	seconde:NATURAL_8
	do
		result:=i_seconde
	end

feature {NONE} -- Implementation

	i_heure:NATURAL_8
	i_minute:NATURAL_8
	i_seconde:NATURAL_8

end
