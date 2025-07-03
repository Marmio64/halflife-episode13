/obj/machinery/computer/terminal/halflife
	name = "old terminal"
	desc = "An old pre-war computer in poor condition."
	circuit = /obj/item/circuitboard/computer/terminal/halflife
	upperinfo = "STARTUP FAILURE"
	content = list("An operating system wasn't found. Try disconnecting any drives that don't contain an operating system. <br><br> Press Ctrl+Alt+Delete to restart")

/obj/item/circuitboard/computer/terminal/halflife
	name = "old terminal circuitboard"
	desc = "An old circuitboard from a terminal. You can't seem to get any more use out of it."
	build_path = /obj/machinery/computer/terminal/halflife

/obj/machinery/computer/terminal/halflife/ferry
	name = "old ferry computer"
	desc = "A helm computer for a now-defunct ferry."
	upperinfo = "MV Euzebiusz Weznikaz -- Black Box Record"
	content = list("Black box data corruption detected - Recovered data as follows: <br><br> NAVY RADIO IN: UN HAS SURRENDERED TO INVADERS RETURN TO PORT IMMEDIATELY <br><br> BRIDGE VOICE: 'Well shit.' <br><br> COMMERCIAL RADIO OUT: AFFIRMATIVE WEZNIKAZ PULLING INTO COAST AND EVACUATING")
