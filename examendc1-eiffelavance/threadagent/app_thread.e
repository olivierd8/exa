note
	description : "project application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APP_THREAD

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			thread1,thread2:EX_THREAD
			quit_thread:EX_EVENT
		do
			create thread1.make("1")
			create thread2.make ("2")
			create quit_thread.make (agent quit) -- Inscrivez '0' suivi de la touche Enter pour quitter
			thread1.launch
			thread2.launch
			quit_thread.launch
			from must_quit:=false
			until must_quit
			loop
				io.put_string ("A")
			end
			io.put_new_line
			io.put_string ("******************************** Quitting! ****************************************")
			io.put_new_line
			thread1.stop_thread
			thread2.stop_thread
			thread1.join
			thread2.join
			quit_thread.join
			io.put_new_line
		end

feature {NONE} -- Implementation

	must_quit:BOOLEAN

	quit
	do
		must_quit:=true
	end

end
