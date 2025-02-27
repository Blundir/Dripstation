#define AIR_CONTENTS	((25*ONE_ATMOSPHERE)*(air_contents.return_volume())/(R_IDEAL_GAS_EQUATION*air_contents.return_temperature()))
/obj/machinery/atmospherics/components/unary/tank
	icon = 'icons/obj/atmospherics/pipes/pressure_tank.dmi'
	icon_state = "generic"

	name = "pressure tank"
	desc = "A large vessel containing pressurized gas."

	max_integrity = 800
	density = TRUE
	layer = ABOVE_WINDOW_LAYER
	pipe_flags = PIPING_ONE_PER_TURF

	var/volume = 10000 //in liters
	var/gas_type = 0

/obj/machinery/atmospherics/components/unary/tank/New()
	..()
	var/datum/gas_mixture/air_contents = airs[1]
	air_contents.set_volume(volume)
	air_contents.set_temperature(T20C)
	if(gas_type)
		air_contents.set_moles(AIR_CONTENTS)
		name = "[name] ([GLOB.meta_gas_info[gas_type][META_GAS_NAME]])"
	setPipingLayer(piping_layer)


/obj/machinery/atmospherics/components/unary/tank/air
	icon_state = "air"
	name = "pressure tank (Air)"

/obj/machinery/atmospherics/components/unary/tank/air/New()
	..()
	var/datum/gas_mixture/air_contents = airs[1]
	air_contents.set_moles(/datum/gas/oxygen, AIR_CONTENTS * 0.2)
	air_contents.set_moles(/datum/gas/nitrogen, AIR_CONTENTS * 0.8)

/obj/machinery/atmospherics/components/unary/tank/carbon_dioxide
	gas_type = /datum/gas/carbon_dioxide

/obj/machinery/atmospherics/components/unary/tank/carbon_dioxide/New()
	..()
	var/datum/gas_mixture/air_contents = airs[1]
	air_contents.set_moles(/datum/gas/carbon_dioxide, AIR_CONTENTS)

/obj/machinery/atmospherics/components/unary/tank/toxins
	icon_state = "toxins"
	gas_type = /datum/gas/plasma

/obj/machinery/atmospherics/components/unary/tank/toxins/New()
	..()
	var/datum/gas_mixture/air_contents = airs[1]
	air_contents.set_moles(/datum/gas/plasma, AIR_CONTENTS)

/obj/machinery/atmospherics/components/unary/tank/oxygen
	icon_state = "o2"
	gas_type = /datum/gas/oxygen

/obj/machinery/atmospherics/components/unary/tank/oxygen/New()
	..()
	var/datum/gas_mixture/air_contents = airs[1]
	air_contents.set_moles(/datum/gas/oxygen, AIR_CONTENTS)

/obj/machinery/atmospherics/components/unary/tank/nitrogen
	icon_state = "n2"
	gas_type = /datum/gas/nitrogen

/obj/machinery/atmospherics/components/unary/tank/nitrogen/New()
	..()
	var/datum/gas_mixture/air_contents = airs[1]
	air_contents.set_moles(/datum/gas/nitrogen, AIR_CONTENTS)
