note
	description: "Summary description for {TIME}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	TIME

inherit
	ANY
	redefine
		out
	end

feature {NONE} -- Initialisation

	make(a_heure,a_minute,a_seconde:NATURAL_8)
	require
		heure_valide: a_heure <24
		minute_valide: a_minute <60
		seconde_valide: a_seconde <60
	do
		set_heure(a_heure)
		set_minute(a_minute)
		set_seconde(a_seconde)
	ensure
		heure_set: heure=a_heure
		minute_set: minute=a_minute
		seconde_set: seconde=a_seconde
	end

feature {NONE} -- Assigner

	set_heure(a_heure:NATURAL_8)
	require
		heure_valide: a_heure <24
	deferred
	ensure
		heure_set: heure=a_heure
		minute_non_change: minute = old minute
		seconde_non_change: seconde = old seconde
	end

	set_minute(a_minute:NATURAL_8)
	require
		minute_valide: a_minute <60
	deferred
	ensure
		minute_set: minute=a_minute
		heure_non_change: heure = old heure
		seconde_non_change: seconde = old seconde
	end

	set_seconde(a_seconde:NATURAL_8)
	require
		seconde_valide: a_seconde <60
	deferred
	ensure
		seconde_set: seconde=a_seconde
		heure_non_change: heure = old heure
		minute_non_change: minute = old minute
	end

feature {ANY} -- Access

	heure:NATURAL_8 assign set_heure
	deferred
	ensure
		heure_non_change: heure = old heure
		minute_non_change: minute = old minute
		seconde_non_change: seconde = old seconde
	end

	minute:NATURAL_8 assign set_minute
	deferred
	ensure
		heure_non_change: heure = old heure
		minute_non_change: minute = old minute
		seconde_non_change: seconde = old seconde
	end

	seconde:NATURAL_8 assign set_seconde
	deferred
	ensure
		heure_non_change: heure = old heure
		minute_non_change: minute = old minute
		seconde_non_change: seconde = old seconde
	end

	out:STRING
	do
		result:=heure.out+":"+minute.out+":"+seconde.out
	end


invariant
	heure_non_valide: heure < 24
	minute_non_valide: minute < 60
	seconde_non_valide: seconde < 60
end
