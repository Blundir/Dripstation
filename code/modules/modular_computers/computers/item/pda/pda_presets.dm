/obj/item/modular_computer/tablet/pda/preset
	starting_components = list( /obj/item/computer_hardware/processor_unit/pda,
								/obj/item/stock_parts/cell/computer/micro,
								/obj/item/computer_hardware/hard_drive/small/pda,
								/obj/item/computer_hardware/network_card,
								/obj/item/computer_hardware/card_slot)

// This is literally the worst possible cheap tablet
/obj/item/modular_computer/tablet/pda/preset/basic
	desc = "A standard issue PDA often given to station personnel."

/obj/item/modular_computer/tablet/pda/preset/chem
	finish_color = "chem"
	starting_components = list( /obj/item/computer_hardware/processor_unit/pda,
								/obj/item/stock_parts/cell/computer/micro,
								/obj/item/computer_hardware/hard_drive/small/pda,
								/obj/item/computer_hardware/network_card,
								/obj/item/computer_hardware/card_slot,
								/obj/item/computer_hardware/sensorpackage
								)
/obj/item/modular_computer/tablet/pda/preset/chem/Initialize()
	starting_files |= list(
		new /datum/computer_file/program/chemscan
	)	
	. = ..()

/obj/item/modular_computer/tablet/pda/preset/medical
	finish_color = "med"

/obj/item/modular_computer/tablet/pda/preset/medical/Initialize()
	starting_files |= list(
		new /datum/computer_file/program/crew_monitor
	)	
	. = ..()

/obj/item/modular_computer/tablet/pda/preset/paramed
	finish_color = "med"

/obj/item/modular_computer/tablet/pda/preset/paramed/Initialize()
	starting_files |= list(
		new /datum/computer_file/program/crew_monitor,
		new /datum/computer_file/program/radar/lifeline
	)	
	. = ..()

/obj/item/modular_computer/tablet/pda/preset/phys
	finish_color = "phys"

/obj/item/modular_computer/tablet/pda/preset/phys/Initialize()
	starting_files |= list(
		new /datum/computer_file/program/crew_monitor,
		new /datum/computer_file/program/radar/lifeline
	)	
	. = ..()

/obj/item/modular_computer/tablet/pda/preset/engineering
	finish_color = "engi"

/obj/item/modular_computer/tablet/pda/preset/engineering/Initialize()
	starting_files |= list(
		new /datum/computer_file/program/alarm_monitor,
		new /datum/computer_file/program/supermatter_monitor,
		new /datum/computer_file/program/power_monitor
	)	
	. = ..()

/obj/item/modular_computer/tablet/pda/preset/warden
	finish_color = "warden"

/obj/item/modular_computer/tablet/pda/preset/warden/Initialize()
	starting_files |= list(
		new /datum/computer_file/program/secureye,
	)	
	. = ..()

/obj/item/modular_computer/tablet/pda/preset/robo
	finish_color = "robo"

/obj/item/modular_computer/tablet/pda/preset/robo/Initialize()
	starting_files |= list(
		new /datum/computer_file/program/robocontrol,
	)	
	. = ..()

/obj/item/modular_computer/tablet/pda/preset/cargo
	finish_color = "car"

/obj/item/modular_computer/tablet/pda/preset/cargo/Initialize()
	starting_files |= list(
		new /datum/computer_file/program/bounty_board,
		new /datum/computer_file/program/budgetorders,
		new /datum/computer_file/program/cargobounty
	)	
	. = ..()

/obj/item/modular_computer/tablet/pda/preset/basic/atmos
	finish_color = "atmos"	
	starting_components = list( /obj/item/computer_hardware/processor_unit/pda,
								/obj/item/stock_parts/cell/computer/micro,
								/obj/item/computer_hardware/hard_drive/small/pda,
								/obj/item/computer_hardware/network_card,
								/obj/item/computer_hardware/card_slot,
								/obj/item/computer_hardware/sensorpackage)

/obj/item/modular_computer/tablet/pda/preset/basic/atmos/Initialize()
	starting_files |= list(
		new /datum/computer_file/program/atmosscan,
		new /datum/computer_file/program/alarm_monitor,
		new /datum/computer_file/program/supermatter_monitor
	)	
	. = ..()

/obj/item/modular_computer/tablet/pda/preset/basic/mime
	finish_color = "mime"	
	pen_type = /obj/item/toy/crayon/mime

/obj/item/modular_computer/tablet/pda/preset/basic/fountainpen // QM, Lawyer, Curator, Bartender
	pen_type = /obj/item/pen/fountain

/obj/item/modular_computer/tablet/pda/preset/basic/fountainpen/bartender
	finish_color = "bar"	

/obj/item/modular_computer/tablet/pda/preset/basic/fountainpen/library
	finish_color = "libb"

/obj/item/modular_computer/tablet/pda/preset/basic/fountainpen/law
	finish_color = "law"

/obj/item/modular_computer/tablet/pda/preset/basic/sec 
	finish_color = "sec"

/obj/item/modular_computer/tablet/pda/preset/basic/det 
	finish_color = "det"

/obj/item/modular_computer/tablet/pda/preset/basic/cook
	finish_color = "chef"

/obj/item/modular_computer/tablet/pda/preset/basic/chap
	finish_color = "chap"

/obj/item/modular_computer/tablet/pda/preset/basic/botany
	finish_color = "bot"

/obj/item/modular_computer/tablet/pda/preset/basic/gen
	finish_color = "gen"

/obj/item/modular_computer/tablet/pda/preset/basic/jan
	finish_color = "jani"

/obj/item/modular_computer/tablet/pda/preset/basic/sci
	finish_color = "sci"

/obj/item/modular_computer/tablet/pda/preset/basic/mine
	finish_color = "mine"

/obj/item/modular_computer/tablet/pda/preset/basic/viro
	finish_color = "viro"

// Honk
/obj/item/modular_computer/tablet/pda/preset/basic/clown
	desc = "A hilarious PDA often given to station pranksters."
	finish_color = "clown"
	pen_type = /obj/item/toy/crayon/rainbow

/obj/item/modular_computer/tablet/pda/preset/basic/clown/Initialize()
	. = ..()
	AddComponent(/datum/component/slippery, 120, NO_SLIP_WHEN_WALKING)
