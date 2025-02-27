/obj/item/reagent_containers/blood
	name = "blood pack"
	desc = "Contains blood used for transfusion. Must be attached to an IV drip."
	icon = 'icons/obj/bloodpack.dmi'
	icon_state = "bloodpack"
	volume = 200
	var/blood_type = null
	var/unique_blood = null
	var/labelled = 0

#define BLOODBAG_GULP_SIZE 10

/obj/item/reagent_containers/blood/attack(mob/target, mob/user, def_zone)
	if(!reagents.total_volume)
		user.balloon_alert(user, "empty!")
		return ..()

	if(target != user)
		if(!do_after(user, 5 SECONDS, target))
			return
		user.visible_message(
			span_notice("[user] forces [target] to drink from the [src]."),
			span_notice("You put the [src] up to [target]'s mouth."),
		)
		reagents.reaction(user, INGEST, BLOODBAG_GULP_SIZE)
		reagents.trans_to(user, BLOODBAG_GULP_SIZE, transfered_by = user)
		playsound(user.loc, 'sound/items/drink.ogg', rand(10, 50), TRUE)
		return TRUE

	while(do_after(user, 1 SECONDS, stayStill = FALSE))
		user.visible_message(
			span_notice("[user] puts the [src] up to their mouth."),
			span_notice("You take a sip from the [src]."),
		)
		var/datum/antagonist/vampire/V = is_vampire(user)
		V?.usable_blood += 5
		reagents.reaction(user, INGEST, BLOODBAG_GULP_SIZE)
		reagents.trans_to(user, BLOODBAG_GULP_SIZE, transfered_by = user)
		playsound(user.loc, 'sound/items/drink.ogg', rand(10, 50), TRUE)
	return TRUE

#undef BLOODBAG_GULP_SIZE

///Bloodbag of Bloodsucker blood (used by Vassals only)
/obj/item/reagent_containers/blood/o_minus/bloodsucker
	name = "blood pack"
	unique_blood = /datum/reagent/blood/bloodsucker

/obj/item/reagent_containers/blood/o_minus/bloodsucker/examine(mob/user)
	. = ..()
	if(user.mind.has_antag_datum(/datum/antagonist/ex_vassal) || user.mind.has_antag_datum(/datum/antagonist/vassal/revenge))
		. += span_notice("Seems to be just about the same color as your Master's...")


/obj/item/reagent_containers/blood/Initialize()
	. = ..()
	if(blood_type != null)
		reagents.add_reagent(unique_blood ? unique_blood : /datum/reagent/blood, 200, list("donor"=null,"viruses"=null,"blood_DNA"=null,"blood_type"=blood_type,"resistances"=null,"trace_chem"=null))
		update_icon()

/obj/item/reagent_containers/blood/on_reagent_change(changetype)
	if(reagents)
		var/datum/reagent/blood/B = reagents.has_reagent(/datum/reagent/blood)
		if(B && B.data && B.data["blood_type"])
			blood_type = B.data["blood_type"]
		else
			blood_type = null
	update_pack_name()
	update_icon()

/obj/item/reagent_containers/blood/proc/update_pack_name()
	if(!labelled)
		if(blood_type)
			name = "blood pack - [blood_type]"
		else
			name = "blood pack"

/obj/item/reagent_containers/blood/update_icon()
	cut_overlays()

	if(blood_type)
		add_overlay(image('icons/obj/bloodpack.dmi', "[blood_type]"))

	var/v = min(round(reagents.total_volume / volume * 10), 10)
	if(v > 0)
		var/mutable_appearance/filling = mutable_appearance('icons/obj/reagentfillings.dmi', "bloodpack1")
		filling.icon_state = "bloodpack[v]"
		filling.color = mix_color_from_reagents(reagents.reagent_list)
		add_overlay(filling)

/obj/item/reagent_containers/blood/random
	icon_state = "random_bloodpack"

/obj/item/reagent_containers/blood/random/Initialize()
	icon_state = "bloodpack"
	blood_type = pick("A+", "A-", "B+", "B-", "O+", "O-", "L")
	return ..()

/obj/item/reagent_containers/blood/APlus
	blood_type = "A+"

/obj/item/reagent_containers/blood/AMinus
	blood_type = "A-"

/obj/item/reagent_containers/blood/BPlus
	blood_type = "B+"

/obj/item/reagent_containers/blood/BMinus
	blood_type = "B-"

/obj/item/reagent_containers/blood/OPlus
	blood_type = "O+"

/obj/item/reagent_containers/blood/OMinus
	blood_type = "O-"

/obj/item/reagent_containers/blood/lizard
	desc = "Contains blood used for lizard transfusion. Must be attached to an IV drip."
	blood_type = "L"

/obj/item/reagent_containers/blood/ethereal
	desc = "Contains so called 'liquid electricity' which is a blood resource of ethereals."
	blood_type = "LE"
	unique_blood = /datum/reagent/consumable/liquidelectricity

/obj/item/reagent_containers/blood/ethereal/update_icon()
	. = ..()
	add_overlay(image('icons/obj/bloodpack.dmi', "LE"))

/obj/item/reagent_containers/blood/ethereal/update_pack_name()
	if(!labelled)
		name = "blood pack - LE"

/obj/item/reagent_containers/blood/universal
	blood_type = "U"

/obj/item/reagent_containers/blood/attackby(obj/item/I, mob/user, params)
	if (istype(I, /obj/item/pen) || istype(I, /obj/item/toy/crayon))
		if(!user.is_literate())
			to_chat(user, span_notice("You scribble illegibly on the label of [src]!"))
			return
		var/t = stripped_input(user, "What would you like to label the blood pack?", name, null, 53)
		if(!user.canUseTopic(src, BE_CLOSE))
			return
		if(user.get_active_held_item() != I)
			return
		if(t)
			labelled = 1
			name = "blood pack - [t]"
		else
			labelled = 0
			update_pack_name()
	else
		return ..()
