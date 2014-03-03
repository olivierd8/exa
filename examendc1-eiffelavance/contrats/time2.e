note
	description: "Summary description for {TIME2}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TIME2

inherit
	TIME

create
	make,
	make_from_seconde

feature {NONE} -- Initialisation

	make_from_seconde(a_seconde_depuis_minuit:NATURAL_32)
	require
		seconde_depuis_minuit_valide: a_seconde_depuis_minuit < 86400
	do
		seconde_depuis_minuit:=a_seconde_depuis_minuit
	ensure
		seconde_depuis_minuit_set: seconde_depuis_minuit=a_seconde_depuis_minuit
	end

feature {NONE} -- Assigner

	set_heure(a_heure:NATURAL_8)
	do
		seconde_depuis_minuit:=((seconde_depuis_minuit\\3600)+a_heure.to_natural_32*3600).to_natural_32
	end

	set_minute(a_minute:NATURAL_8)
	do
		seconde_depuis_minuit:=(heure.to_natural_32*3600+a_minute.to_natural_32*60+seconde.to_natural_32).to_natural_32
	end

	set_seconde(a_seconde:NATURAL_8)
	do
		seconde_depuis_minuit:=(heure.to_natural_32*3600+minute.to_natural_32*60+a_seconde.to_natural_32).to_natural_32
	end

feature {ANY} -- Access

	heure:NATURAL_8
	do
		result:=(seconde_depuis_minuit//3600).to_natural_8
	end

	minute:NATURAL_8
	do
		result:=((seconde_depuis_minuit\\3600)//60).to_natural_8
	end

	seconde:NATURAL_8
	do
		result:=(seconde_depuis_minuit\\60).to_natural_8
	end

feature {NONE} -- Implementation

	seconde_depuis_minuit:NATURAL_32

invariant
	seconde_depuis_minuit_valide: seconde_depuis_minuit<86400

end
