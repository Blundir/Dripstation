/* Clown Items
 * Contains:
 *		Soap
 *		Bike Horns
 *		Air Horns
 *		Canned Laughter
 */

/*
 * Soap
 */

/obj/item/soap
	name = "soap"
	desc = "A cheap bar of soap. Doesn't smell."
	gender = PLURAL
	icon = 'icons/obj/janitor.dmi'
	icon_state = "soap"
	lefthand_file = 'icons/mob/inhands/equipment/custodial_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/custodial_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	item_flags = NOBLUDGEON
	throwforce = 0
	throw_speed = 3
	throw_range = 7
	grind_results = list(/datum/reagent/lye = 10)
	var/cleanspeed = 35 //slower than mop
	force_string = "robust... against germs"
	var/uses = 100

/obj/item/soap/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/slippery, 80)
	AddComponent(/datum/component/cleaner, cleanspeed, 0.1, on_cleaned_callback=CALLBACK(src, .proc/decreaseUses)) //less scaling for soapies

/obj/item/soap/examine(mob/user)
	. = ..()
	var/max_uses = initial(uses)
	var/msg = "It looks like it just came out of the package."
	if(uses != max_uses)
		var/percentage_left = uses / max_uses
		switch(percentage_left)
			if(0 to 0.15)
				msg = "There's just a tiny bit left of what it used to be, you're not sure it'll last much longer."
			if(0.15 to 0.30)
				msg = "It's dissolved quite a bit, but there's still some life to it."
			if(0.30 to 0.50)
				msg = "It's past its prime, but it's definitely still good."
			if(0.50 to 0.75)
				msg = "It's started to get a little smaller than it used to be, but it'll definitely still last for a while."
			else
				msg = "It's seen some light use, but it's still pretty fresh."
	. += span_notice("[msg]")

/obj/item/soap/nanotrasen
	desc = "A heavy duty bar of Nanotrasen brand soap. Smells of plasma."
	grind_results = list(/datum/reagent/toxin/plasma = 10, /datum/reagent/lye = 10)
	icon_state = "soapnt"
	cleanspeed = 28 //janitor gets this
	uses = 300

/obj/item/soap/homemade
	desc = "A homemade bar of soap. Smells of...not much."
	icon_state = "soapgibs"
	cleanspeed = 30 // faster to reward chemists for going to the effort

/obj/item/soap/deluxe
	desc = "A deluxe Waffle Co. brand bar of soap. Smells of high-class luxury."
	icon_state = "soapdeluxe"
	cleanspeed = 20 //captain gets one of these

/obj/item/soap/syndie
	desc = "An untrustworthy bar of soap made of strong chemical agents that dissolve blood faster."
	icon_state = "soapsyndie"
	cleanspeed = 5 //faster than mop so it is useful for traitors who want to clean crime scenes

/obj/item/soap/suicide_act(mob/user)
	user.say(";FFFFFFFFFFFFFFFFUUUUUUUDGE!!", forced="soap suicide")
	user.visible_message(span_suicide("[user] lifts [src] to [user.p_their()] mouth and gnaws on it furiously, producing a thick froth! [user.p_they(TRUE)]'ll never get that BB gun now!"))
	new /obj/effect/particle_effect/fluid/foam(loc)
	return (TOXLOSS)

/* Arguments
 * * source - the source of the cleaning
 * * target - The atom that is being cleaned
 * * user - The mob that is using the soap to clean.
 */
/obj/item/soap/proc/decreaseUses(datum/source, atom/target, mob/living/user, amount)
	uses -= amount
	if(uses <= 0)
		to_chat(user, span_warning("[src] crumbles into tiny bits!"))
		qdel(src)

/obj/item/soap/afterattack(atom/target, mob/user, proximity)
	. = ..()
	if(iscarbon(target) && user == target && user.zone_selected == BODY_ZONE_PRECISE_MOUTH && user.a_intent == INTENT_HELP) //mmm, soap...
		var/mob/living/carbon/C = user
		user.visible_message(span_notice("[user] takes a bite out of [src.name]!"), span_notice("You gnaw on [src]! This can't be good for you..."))
		playsound(get_turf(C), 'sound/items/eatfood.ogg', 25, 0)
		C.reagents.add_reagent(/datum/reagent/toxin/formaldehyde, 2)
		C.reagents.add_reagent(/datum/reagent/toxin/chloralhydrate, 3)
		SEND_SIGNAL(C, COMSIG_ADD_MOOD_EVENT, "toxic_food", /datum/mood_event/disgusting_food)
		decreaseUses(user, 20)
		return
	if(!proximity || !check_allowed_items(target))
		return
	//I couldn't feasibly  fix the overlay bugs caused by cleaning items we are wearing.
	//So this is a workaround. This also makes more sense from an IC standpoint. ~Carn
	if(user.client && ((target in user.client.screen) && !user.is_holding(target)))
		to_chat(user, span_warning("You need to take that [target.name] off before cleaning it!"))
	else if(ishuman(target) && user.zone_selected == BODY_ZONE_PRECISE_MOUTH)
		var/mob/living/carbon/human/H = user
		user.visible_message(span_warning("\the [user] washes \the [target]'s mouth out with [src.name]!"), span_notice("You wash \the [target]'s mouth out with [src.name]!")) //washes mouth out with soap sounds better than 'the soap' here			if(user.zone_selected == "mouth")
		H.lip_style = null //removes lipstick
		H.update_body()
		decreaseUses(user)
		return
	else
		user.visible_message("[user] begins to clean \the [target.name] with [src]...", span_notice("You begin to clean \the [target.name] with [src]..."))
		start_cleaning(src, target, user) //normal cleaning
	return


/*
 * Bike Horns
 */

/obj/item/bikehorn
	name = "bike horn"
	desc = "A horn off of a bicycle."
	icon = 'icons/obj/toy.dmi'
	icon_state = "bike_horn"
	item_state = "bike_horn"
	lefthand_file = 'icons/mob/inhands/equipment/horns_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/horns_righthand.dmi'
	throwforce = 0
	hitsound = null //To prevent tap.ogg playing, as the item lacks of force
	w_class = WEIGHT_CLASS_TINY
	slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_BELT
	throw_speed = 3
	throw_range = 7
	attack_verb = list("HONKED")
	fryable = TRUE

/obj/item/bikehorn/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(istype(target, /obj/item/organ/tongue))
		var/obj/item/organ/tongue/T = target
		if(T) // this would be awkward if there wasn't a tongue here at this point
			user.visible_message(span_alert("[user] shoves [src] inside of [T]!"))
			T.honked = TRUE
			T.update_icon()
			qdel(src)

/obj/item/bikehorn/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, list('sound/items/bikehorn.ogg'=1), 50)

/obj/item/bikehorn/attack(mob/living/carbon/M, mob/living/carbon/user)
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "honk", /datum/mood_event/honk)
	return ..()

/obj/item/bikehorn/suicide_act(mob/user)
	user.visible_message(span_suicide("[user] solemnly points [src] at [user.p_their()] temple! It looks like [user.p_theyre()] trying to commit suicide!"))
	playsound(src, 'sound/items/bikehorn.ogg', 50, TRUE)
	return (BRUTELOSS)

//air horn
/obj/item/bikehorn/airhorn
	name = "air horn"
	desc = "Damn son, where'd you find this?"
	icon_state = "air_horn"

/obj/item/bikehorn/airhorn/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, list('sound/items/airhorn2.ogg'=1), 50)

//golden bikehorn
/obj/item/bikehorn/golden
	name = "golden bike horn"
	desc = "Golden? Clearly, it's made with bananium! Honk!"
	icon_state = "gold_horn"
	item_state = "gold_horn"
	var/flip_cooldown = 0

/obj/item/bikehorn/golden/attack()
	if(flip_cooldown < world.time)
		flip_mobs()
	return ..()

/obj/item/bikehorn/golden/attack_self(mob/user)
	if(flip_cooldown < world.time)
		flip_mobs()
	..()

/obj/item/bikehorn/golden/proc/flip_mobs(mob/living/carbon/M, mob/user)
	var/turf/T = get_turf(src)
	for(M in ohearers(7, T))
		if(ishuman(M) && M.can_hear())
			var/mob/living/carbon/human/H = M
			if(istype(H.ears, /obj/item/clothing/ears/earmuffs))
				continue
		M.emote("flip")
	flip_cooldown = world.time + 7

//canned laughter
/obj/item/reagent_containers/food/drinks/soda_cans/canned_laughter
	name = "Canned Laughter"
	desc = "Just looking at this makes you want to giggle."
	icon_state = "laughter"
	list_reagents = list(/datum/reagent/consumable/laughter = 50)
