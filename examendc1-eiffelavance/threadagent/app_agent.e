note
	description : "project application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APP_AGENT

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			l_addition:FUNCTION[ANY,TUPLE[a,b:INTEGER],INTEGER]
			l_incrementation:FUNCTION[ANY,TUPLE[a:INTEGER],INTEGER]
			l_5:FUNCTION[ANY,TUPLE,INTEGER]
		do
			l_addition:=agent addition
			l_incrementation:=agent addition(1,?)
			l_5:=agent addition(4,1)
			use_addition(l_addition)
			io.put_new_line
			l_incrementation:=agent addition(1,?)
			use_incrementation(l_incrementation)
			io.put_new_line
			l_5:=agent addition(4,1)
			io.put_integer (l_5.item ([]))
			io.put_new_line
			inline_print
			io.put_new_line
		end

	use_addition(a_addition:FUNCTION[ANY,TUPLE[a,b:INTEGER],INTEGER])
	local
		a,b:INTEGER
	do

		a:=5
		b:=8
		io.put_string ("5+8=")
		io.put_integer (a_addition.item ([a,b]))
	end

	use_incrementation(a_incrementation:FUNCTION[ANY,TUPLE[a:INTEGER],INTEGER])
	local
		l_liste_entier:ARRAYED_LIST[INTEGER]
		i:INTEGER
	do
		create l_liste_entier.make_filled(10)
		from i:=1
		until i>10
		loop
			l_liste_entier[i]:=i*10
			i:=i+1
		end
		io.put_string ("Avant incrementation:%N")
		l_liste_entier.do_all_with_index (agent print_element)
		from i:=1
		until i>10
		loop
			l_liste_entier[i]:=a_incrementation.item ([l_liste_entier.at (i)])
			i:=i+1
		end
		io.put_string ("Apres incrementation:%N")
		l_liste_entier.do_all_with_index (agent print_element)
	end

	print_element(a_element,a_index:INTEGER)
	do
		io.put_integer (a_index)
		io.put_string (" -> ")
		io.put_integer (a_element)
		io.put_new_line
	end

	inline_print
	local
		l_chaines:LIST[STRING]
	do
		create {ARRAYED_LIST[STRING]} l_chaines.make(5)
		l_chaines.extend ("Item 1")
		l_chaines.extend ("Item 2")
		l_chaines.extend ("Item 3")
		l_chaines.extend ("Item 4")
		l_chaines.extend ("Item 5")
		l_chaines.do_all (agent (s:STRING)
							do
								io.put_string (s+"%N")
							end )
	end



feature {NONE} -- Implementation


	addition(a,b:INTEGER):INTEGER
	do
		result:=a+b
	end

end
