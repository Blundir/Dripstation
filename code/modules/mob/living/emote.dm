
/* EMOTE DATUMS */
/datum/emote/living
	mob_type_allowed_typecache = /mob/living
	mob_type_blacklist_typecache = list(/mob/living/simple_animal/slime, /mob/living/brain)

/datum/emote/living/blush
	key = "blush"
	key_third_person = "blushes"
	message = "краснеет."

/datum/emote/living/bow
	key = "bow"
	key_third_person = "bows"
	message = "делает поклон."
	message_param = "bows to %t."
	restraint_check = TRUE

/datum/emote/living/burp
	key = "burp"
	key_third_person = "burps"
	message = "рыгает."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/choke
	key = "choke"
	key_third_person = "chokes"
	message = "подавился!"
	message_female = "подавилась!"
	emote_type = EMOTE_AUDIBLE
	stat_allowed = SOFT_CRIT

/datum/emote/living/cross
	key = "cross"
	key_third_person = "crosses"
	message = "crosses their arms."
	restraint_check = TRUE

/datum/emote/living/shiver
	key = "shiver"
	message = "дрожит."

/datum/emote/living/chuckle
	key = "chuckle"
	key_third_person = "chuckles"
	message = "усмехается."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/collapse
	key = "collapse"
	key_third_person = "collapses"
	message = "теряет сознание!"

/datum/emote/living/collapse/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.Unconscious(40)

/datum/emote/living/cough
	key = "cough"
	key_third_person = "coughs"
	message = "кашляет!"
	message_mime = "бесшумно кашляет!"
	emote_type = EMOTE_AUDIBLE
	stat_allowed = SOFT_CRIT

/datum/emote/living/cough/can_run_emote(mob/user, status_check = TRUE , intentional)
	. = ..()
	if(HAS_TRAIT(user, TRAIT_SOOTHED_THROAT))
		return FALSE

/datum/emote/living/dance
	key = "dance"
	key_third_person = "dances"
	message = "радостно танцует."
	restraint_check = TRUE

/datum/emote/living/dance/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	var/mob/living/L = user
	if(. && isliving(user))
		L.spin(10, 1)

/datum/emote/living/deathgasp
	key = "deathgasp"
	key_third_person = "deathgasps"
	message = "seizes up and falls limp, their eyes dead and lifeless..."
	message_robot = "shudders violently for a moment before falling still, its eyes slowly darkening."
	message_AI = "lets out a flurry of sparks, its screen flickering as its systems slowly halt."
	message_alien = "lets out a waning guttural screech, green blood bubbling from its maw..."
	message_larva = "lets out a sickly hiss of air and falls limply to the floor..."
	message_monkey = "lets out a faint chimper as it collapses and stops moving..."
	message_ipc = "gives one shrill beep before falling limp, their monitor flashing blue before completely shutting off..."
	message_simple =  "stops moving..."
	stat_allowed = UNCONSCIOUS
	cooldown = 3.4 SECONDS

/datum/emote/living/deathgasp/run_emote(mob/user, params, type_override, intentional)
	var/mob/living/simple_animal/S = user
	if(istype(S) && S.deathmessage)
		message_simple = S.deathmessage
	. = ..()
	message_simple = initial(message_simple)
	if(. && user.deathsound)
		if(isliving(user))
			var/mob/living/L = user
			if(!L.can_speak_vocal() || L.oxyloss >= 50)
				return //stop the sound if oxyloss too high/cant speak
		playsound(user, user.deathsound, 200, TRUE, TRUE)

/datum/emote/living/drool
	key = "drool"
	key_third_person = "drools"
	message = "пускает слюни."

/datum/emote/living/faint
	key = "faint"
	key_third_person = "faints"
	message = "faints."
	stat_allowed = SOFT_CRIT

/datum/emote/living/faint/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.SetSleeping(200)

/datum/emote/living/trip
	key = "trip"
	key_third_person = "trips"
	message = "спотыкается и падает!"

/datum/emote/living/trip/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.Knockdown(60)

/datum/emote/living/flap
	key = "flap"
	key_third_person = "flaps"
	message = "хлопает крыльями."
	restraint_check = TRUE
	var/wing_time = 20

/datum/emote/living/flap/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		var/open = FALSE
		if(H.dna.features["wings"] != "None")
			if("wingsopen" in H.dna.species.mutant_bodyparts)
				open = TRUE
				H.CloseWings()
			else
				H.OpenWings()
			addtimer(CALLBACK(H, open ? TYPE_PROC_REF(/mob/living/carbon/human, OpenWings) : TYPE_PROC_REF(/mob/living/carbon/human, CloseWings)), wing_time)

/datum/emote/living/flap/aflap
	key = "aflap"
	key_third_person = "aflaps"
	message = "ЗЛОБНО хлопает крыльями!"
	restraint_check = TRUE
	wing_time = 10

/datum/emote/living/frown
	key = "frown"
	key_third_person = "frowns"
	message = "хмурится."
	stat_allowed = SOFT_CRIT

/datum/emote/living/gag
	key = "gag"
	key_third_person = "gags"
	message = "gags."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/gasp
	key = "gasp"
	key_third_person = "gasps"
	message = "задыхается!"
	emote_type = EMOTE_AUDIBLE
	stat_allowed = UNCONSCIOUS

/datum/emote/living/giggle
	key = "giggle"
	key_third_person = "giggles"
	message = "хихикает."
	message_mime = "бесшумно хихикает!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/giggle/can_run_emote(mob/living/user, status_check = TRUE , intentional)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		return !C.silent

/datum/emote/living/giggle/get_sound(mob/living/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		var/human_laugh = ishumanbasic(H) || iscatperson(H)
		if(human_laugh && (!H.mind || !H.mind.miming))
			if(user.gender == FEMALE)
				return pick('sound/voice/human/womangiggle1.ogg', 'sound/voice/human/womangiggle2.ogg', 'sound/voice/human/womangiggle3.ogg')
			else
				return pick('sound/voice/human/mangiggle1.ogg', 'sound/voice/human/mangiggle2.ogg')

/datum/emote/living/glare
	key = "glare"
	key_third_person = "glares"
	message = "пялится."
	message_param = "glares at %t."

/datum/emote/living/grin
	key = "grin"
	key_third_person = "grins"
	message = "grins."

/datum/emote/living/groan
	key = "groan"
	key_third_person = "groans"
	message = "стонет!"
	message_mime = "делает вид, что стонет!"
	stat_allowed = SOFT_CRIT

/datum/emote/living/grimace
	key = "grimace"
	key_third_person = "grimaces"
	message = "grimaces."

/datum/emote/living/handsup
	key = "handsup"
	key_third_person = "raiseshands"
	message	= span_surrender("raises their hands in the air, they surrender!")
	restraint_check = TRUE

/datum/emote/living/handsup/run_emote(mob/living/user, params, type_override, intentional)
	. = ..()
	if(!.)
		return
	for(var/obj/item/I in user.held_items)
		user.drop_all_held_items(I, TRUE)
	var/obj/item/twohanded/required/raisedhands/L = new(user)
	user.put_in_hands(L)

/datum/emote/living/jump
	key = "jump"
	key_third_person = "jumps"
	message = "прыгает!"
	restraint_check = TRUE

/datum/emote/living/kiss
	key = "kiss"
	key_third_person = "kisses"
	message = "blows a kiss."
	message_param = "blows a kiss to %t."

/datum/emote/living/laugh
	key = "laugh"
	key_third_person = "laughs"
	message = "смеется."
	message_mime = "бесшумно смеется!"
	emote_type = EMOTE_AUDIBLE
	cooldown = 3 SECONDS
	vary = TRUE

/datum/emote/living/laugh/can_run_emote(mob/living/user, status_check = TRUE , intentional)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		return !C.silent

/datum/emote/living/laugh/get_sound(mob/living/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		var/human_laugh = ishumanbasic(H) || iscatperson(H)
		if(human_laugh && (!H.mind || !H.mind.miming))
			if(user.gender == FEMALE)
				return pick('sound/voice/human/womanlaugh1.ogg', 'sound/voice/human/womanlaugh2.ogg', 'sound/voice/human/womanlaugh3.ogg', 'sound/voice/human/womanlaugh4.ogg')
			else
				return pick('sound/voice/human/manlaugh1.ogg', 'sound/voice/human/manlaugh2.ogg', 'sound/voice/human/manlaugh3.ogg')

/datum/emote/living/look
	key = "look"
	key_third_person = "looks"
	message = "смотрит."
	message_param = "looks at %t."

/datum/emote/living/nod
	key = "nod"
	key_third_person = "nods"
	message = "кивает."
	message_param = "nods at %t."
	stat_allowed = SOFT_CRIT

/datum/emote/living/point
	key = "point"
	key_third_person = "points"
	message = "points."
	message_param = "points at %t."
	restraint_check = TRUE

/datum/emote/living/point/run_emote(mob/user, params, type_override, intentional)
	message_param = initial(message_param) // reset
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.get_num_arms() == 0)
			if(H.get_num_legs() != 0)
				message_param = "tries to point at %t with a leg, [span_userdanger("falling down")] in the process!"
				H.Paralyze(20)
			else
				message_param = "[span_userdanger("bumps [user.p_their()] head on the ground")] trying to motion towards %t."
				H.adjustOrganLoss(ORGAN_SLOT_BRAIN, 5)
	..()

/datum/emote/living/pout
	key = "pout"
	key_third_person = "pouts"
	message = "дуется."
	emote_type = EMOTE_VISIBLE

/datum/emote/living/scream
	key = "scream"
	key_third_person = "screams"
	message = "кричит."
	message_mime = "делает вид, что кричит!"
	emote_type = EMOTE_AUDIBLE
	mob_type_blacklist_typecache = list(/mob/living/carbon/human) //Humans get specialized scream.

/datum/emote/living/scream/select_message_type(mob/user, intentional)
	. = ..()
	if(!intentional && isanimal(user))
		return "makes a loud and pained whimper."

/datum/emote/living/scowl
	key = "scowl"
	key_third_person = "scowls"
	message = "scowls."

/datum/emote/living/shake
	key = "shake"
	key_third_person = "shakes"
	message = "качает головой."
	stat_allowed = SOFT_CRIT

/datum/emote/living/sigh
	key = "sigh"
	key_third_person = "sighs"
	message = "вздыхает."
	message_mime = "бесшумно вздыхает."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/sigh/can_run_emote(mob/living/user, status_check = TRUE , intentional)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		return !C.silent

/datum/emote/living/sigh/get_sound(mob/living/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		var/human_laugh = ishumanbasic(H) || iscatperson(H)
		if(human_laugh && (!H.mind || !H.mind.miming))
			if(user.gender == FEMALE)
				return 'sound/voice/human/womansigh.ogg'
			else
				return 'sound/voice/human/mansigh.ogg'

/datum/emote/living/sit
	key = "sit"
	key_third_person = "sits"
	message = "sits down."

/datum/emote/living/smile
	key = "smile"
	key_third_person = "smiles"
	message = "улыбается."

/datum/emote/living/sneeze
	key = "sneeze"
	key_third_person = "sneezes"
	message = "чихает."
	message_mime = "делает вид, что чихает."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/smug
	key = "smug"
	key_third_person = "smugs"
	message = "grins smugly."

/datum/emote/living/sniff
	key = "sniff"
	key_third_person = "sniffs"
	message = "шмыгает носом."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/snore
	key = "snore"
	key_third_person = "snores"
	message = "храпит."
	message_mime = "делает вид, что громко спит."
	emote_type = EMOTE_AUDIBLE
	stat_allowed = UNCONSCIOUS

/datum/emote/living/stare
	key = "stare"
	key_third_person = "stares"
	message = "пялится."
	message_param = "stares at %t."

/datum/emote/living/stretch
	key = "stretch"
	key_third_person = "stretches"
	message = "stretches their arms."

/datum/emote/living/sulk
	key = "sulk"
	key_third_person = "sulks"
	message = "sulks down sadly."

/datum/emote/living/surrender
	key = "surrender"
	key_third_person = "surrenders"
	message = span_surrender("puts their hands on their head and falls to the ground, they surrender!")
	mob_type_blacklist_typecache = list(/mob/living/simple_animal)

/datum/emote/living/surrender/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.Paralyze(200)

/datum/emote/living/sway
	key = "sway"
	key_third_person = "sways"
	message = "sways around dizzily."

/datum/emote/living/tremble
	key = "tremble"
	key_third_person = "trembles"
	message = "трепещет!"
	stat_allowed = SOFT_CRIT

/datum/emote/living/twitch
	key = "twitch"
	key_third_person = "twitches"
	message = "сильно дергается."

/datum/emote/living/twitch_s
	key = "twitch_s"
	message = "дергается."

/datum/emote/living/wave
	key = "wave"
	key_third_person = "waves"
	message = "машет."

/datum/emote/living/whimper
	key = "whimper"
	key_third_person = "whimpers"
	message = "хнычет."
	message_mime = "бесшумно хнычет."
	stat_allowed = SOFT_CRIT
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/wsmile
	key = "wsmile"
	key_third_person = "wsmiles"
	message = "слегка улыбается."

/datum/emote/living/yawn
	key = "yawn"
	key_third_person = "yawns"
	message = "зевает."
	message_mime = "бесшумно зевает."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/custom
	key = "me"
	key_third_person = "custom"
	message = null

/datum/emote/living/custom/can_run_emote(mob/user, status_check, intentional)
	. = ..() && intentional

/datum/emote/living/custom/proc/check_invalid(mob/user, input)
	var/static/regex/stop_bad_mime = regex(@"says|exclaims|yells|asks")
	if(stop_bad_mime.Find(input, 1, 1))
		to_chat(user, span_danger("Invalid emote."))
		return TRUE
	return FALSE

/datum/emote/living/custom/run_emote(mob/user, params, type_override = null, intentional = FALSE)
	if(!can_run_emote(user, TRUE, intentional))
		return FALSE
	if(is_banned_from(user.ckey, "Emote"))
		to_chat(user, "You cannot send custom emotes (banned).")
		return FALSE
	else if(QDELETED(user))
		return FALSE
	else if(user.client && user.client.prefs.muted & MUTE_IC)
		to_chat(user, "You cannot send IC messages (muted).")
		return FALSE
	else if(!params)
		var/custom_emote = copytext(sanitize(to_utf8(input("Choose an emote to display.") as text|null)), 1, MAX_MESSAGE_LEN)
		if(custom_emote && !check_invalid(user, custom_emote))
			var/type = input("Is this a visible or hearable emote?") as null|anything in list("Visible", "Hearable")
			switch(type)
				if("Visible")
					emote_type = EMOTE_VISIBLE
				if("Hearable")
					emote_type = EMOTE_AUDIBLE
				else
					tgui_alert(usr,"Unable to use this emote, must be either hearable or visible.")
					return
			message = custom_emote
	else
		message = params
		if(type_override)
			emote_type = type_override
	if(isnotpretty(message))
		if(user.client.prefs.muted & MUTE_IC)
			return
		user.client.handle_spam_prevention("PRETTY FILTER", MUTE_ALL) // Constant message mutes someone faster for not pretty messages
		to_chat(usr, span_notice("You fumble over your action. <a href='https://forums.yogstation.net/help/rules/#rule-0_1'>See rule 0.1</a>."))
		var/log_message = "[key_name(usr)] just tripped a pretty filter: '[message]'."
		message_admins(log_message)
		log_emote(log_message)
		return
	. = ..()
	message = null
	emote_type = EMOTE_VISIBLE

/datum/emote/living/custom/replace_pronoun(mob/user, message)
	return message

/datum/emote/living/help
	key = "help"

/datum/emote/living/help/run_emote(mob/user, params, type_override, intentional)
	var/list/keys = list()
	var/list/message = list("Available emotes, you can use them with say \"*emote\": ")

	for(var/key in GLOB.emote_list)
		for(var/datum/emote/P in GLOB.emote_list[key])
			if(P.key in keys)
				continue
			if(P.can_run_emote(user, status_check = FALSE , intentional = TRUE))
				keys += P.key

	keys = sortList(keys)

	for(var/emote in keys)
		if(LAZYLEN(message) > 1)
			message += ", [emote]"
		else
			message += "[emote]"

	message += "."

	message = jointext(message, "")

	to_chat(user, message)

/datum/emote/beep
	key = "beep"
	key_third_person = "beeps"
	message = "beeps."
	message_param = "beeps at %t."
	sound = 'sound/machines/twobeep.ogg'
	mob_type_allowed_typecache = list(/mob/living/brain, /mob/living/silicon)
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/circle
	key = "circle"
	key_third_person = "circles"
	restraint_check = TRUE

/datum/emote/living/circle/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	var/obj/item/circlegame/N = new(user)
	if(user.put_in_hands(N))
		to_chat(user, span_notice("You make a circle with your hand."))
	else
		qdel(N)
		to_chat(user, span_warning("You don't have any free hands to make a circle with."))

/datum/emote/living/slap
	key = "slap"
	key_third_person = "slaps"
	restraint_check = TRUE

/datum/emote/living/slap/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(!.)
		return
	var/obj/item/slapper/N = new(user)
	if(user.put_in_hands(N))
		to_chat(user, span_notice("You ready your slapping hand."))
	else
		to_chat(user, span_warning("You're incapable of slapping in your current state."))

/datum/emote/living/thumbsup
	key = "thumbsup"
	key_third_person = "thumbs"
	message = "gives a thumbs up."
	message_param = "gives a thumbs up to %t."
	restraint_check = TRUE

/datum/emote/living/blink
	key = "blink"
	key_third_person = "blinks"
	message = "моргает."

/datum/emote/living/blink_r
	key = "blink_r"
	key_third_person = "blinks rapidly"
	message = "быстро моргает."

/datum/emote/living/salute
	key = "salute"
	key_third_person = "salutes"
	message = "салютует."

/datum/emote/living/salute/get_sound(mob/living/user)
	. = ..()
	return 'sound/effects/salute.ogg'

/datum/emote/living/cry
	key = "cry"
	key_third_person = "cries"
	message = "плачет."
	message_mime = "пускает слезу."


/datum/emote/living/clueless
	key = "clueless"
	key_third_person = "cluelesses"
	message = "looks clueless."
	message_param = "looks cluelessly at %t"
	stat_allowed = SOFT_CRIT
