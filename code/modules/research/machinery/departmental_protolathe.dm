/obj/machinery/rnd/production/protolathe/department
	name = "department protolathe"
	desc = "A special protolathe with a built in interface meant for departmental usage, with built in ExoSync receivers allowing it to print designs researched that match its ROM-encoded department type."
	icon_state = "protolathe"
	circuit = /obj/item/circuitboard/machine/protolathe/department
	requires_console = FALSE

/obj/machinery/rnd/production/protolathe/department/engineering
	name = "department protolathe (Engineering)"
	allowed_department_flags = DEPARTMENTAL_FLAG_ALL|DEPARTMENTAL_FLAG_ENGINEERING
	department_tag = "Engineering"
	stripe_color = "#EFB341CA"	
	circuit = /obj/item/circuitboard/machine/protolathe/department/engineering

/obj/machinery/rnd/production/protolathe/department/service
	name = "department protolathe (Service)"
	allowed_department_flags = DEPARTMENTAL_FLAG_ALL|DEPARTMENTAL_FLAG_SERVICE
	department_tag = "Service"
	stripe_color = "#83CA41CA"	
	circuit = /obj/item/circuitboard/machine/protolathe/department/service

/obj/machinery/rnd/production/protolathe/department/medical
	name = "department protolathe (Medical)"
	allowed_department_flags = DEPARTMENTAL_FLAG_ALL|DEPARTMENTAL_FLAG_MEDICAL
	department_tag = "Medical"
	stripe_color = "#52B4E9CA"	
	circuit = /obj/item/circuitboard/machine/protolathe/department/medical

/obj/machinery/rnd/production/protolathe/department/cargo
	name = "department protolathe (Cargo)"
	allowed_department_flags = DEPARTMENTAL_FLAG_ALL|DEPARTMENTAL_FLAG_CARGO
	department_tag = "Cargo"
	stripe_color = "#956929CA"	
	circuit = /obj/item/circuitboard/machine/protolathe/department/cargo

/obj/machinery/rnd/production/protolathe/department/science
	name = "department protolathe (Science)"
	allowed_department_flags = DEPARTMENTAL_FLAG_ALL|DEPARTMENTAL_FLAG_SCIENCE
	department_tag = "Science"
	stripe_color = "#D381C9CA"	
	circuit = /obj/item/circuitboard/machine/protolathe/department/science

/obj/machinery/rnd/production/protolathe/department/security
	name = "department protolathe (Security)"
	allowed_department_flags = DEPARTMENTAL_FLAG_ALL|DEPARTMENTAL_FLAG_SECURITY
	department_tag = "Security"
	stripe_color = "#DE3A3ACA"	
	circuit = /obj/item/circuitboard/machine/protolathe/department/security
