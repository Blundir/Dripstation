// ###### HOP ######
/obj/item/clothing/under/rank/head_of_personnel
	icon = 'dripstation/icons/obj/clothing/uniform/command/hop.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/uniform/command/hop.dmi'

/obj/item/clothing/under/rank/head_of_personnel/skirt
	can_adjust = TRUE
	mutantrace_variation = MUTANTRACE_VARIATION	

/obj/item/clothing/under/rank/head_of_personnel/dress
	name = "head of personnel's dress"
	icon_state = "hop_dress"
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP	
	body_parts_covered = CHEST|GROIN|ARMS	
	mutantrace_variation = NO_MUTANTRACE_VARIATION	

/obj/item/clothing/under/rank/head_of_personnel/paradefancy
	name = "head of personnel's fancy uniform"
	desc = "For these special occasions when paperwork can wait."
	icon_state = "hopwhimsy"
	item_state = "hopwhimsy"
	can_adjust = FALSE
	mutantrace_variation = NO_MUTANTRACE_VARIATION	

/obj/item/clothing/under/rank/head_of_personnel/parade
	name = "head of personnel's parade uniform"
	desc = "A luxurious uniform for the head of personnel, woven in a deep blue. On the lapel is a small pin in the shape of a corgi's head."
	icon_state = "hop_parade_male"
	can_adjust = FALSE

/obj/item/clothing/under/rank/head_of_personnel/parade/skirt
	name = "head of personnel's parade skirt"
	icon_state = "hop_parade_female"	
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = FEMALE_UNIFORM_TOP


/obj/item/clothing/under/rank/head_of_personnel/turtleneck
	name = "head of personnel's turtleneck"
	desc = "A dark teal turtleneck and black khakis, for a second with a superior sense of style."
	icon_state = "hopturtle"
	can_adjust = TRUE
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/head_of_personnel/turtleneck/skirt
	name = "head of personnel's turtleneck skirt"
	desc = "A dark teal turtleneck and tanblack khaki skirt, for a second with a superior sense of style."
	icon_state = "hopturtle_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = FEMALE_UNIFORM_TOP

/obj/item/clothing/shoes/leather
	name = "leather shoes"
	desc = "A sturdy pair of fancy handmade leather shoes."
	icon = 'dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/shoes.dmi'	
	icon_state = "leather"

/obj/item/clothing/head/hooded/winterhood/hop/formal
	icon = 'dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/hats.dmi'
	icon_state = "winterhood_hopformal"

/obj/item/clothing/suit/hooded/wintercoat/hop/formal
	name = "head of personnel's formal winter coat"
	desc = "A long cozy winter coat, covered in thick fur. The breast features a proud yellow chevron, reminding everyone that you're the second banana. Someone at CC most really like you, huh?"
	icon = 'dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/suits.dmi'
	icon_state = "coathopformal"
	hoodtype = /obj/item/clothing/head/hooded/winterhood/hop/formal

/obj/item/clothing/suit/armor/vest/hopjacket
	name = "head of personnel's parade jacket"
	desc = "A luxurious deep blue jacket for the Head of Personnel, woven with a red trim. It smells of bureaucracy."
	icon_state = "hopformal"
	icon = 'dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/suits.dmi'	
	body_parts_covered = CHEST|GROIN|ARMS
	armor = list(MELEE = 10, BULLET = 15, LASER = 15, ENERGY = 25, BOMB = 10, BIO = 0, RAD = 0, FIRE = 0, ACID = 35)
	allowed = list(
		/obj/item/melee/classic_baton,
	)
	dog_fashion = null

/obj/item/clothing/suit/armor/vest/hopjacket/dress
	name = "head of personnel's parade jacket"
	desc = "A luxurious deep blue jacket for the Head of Personnel, woven with a red trim. It smells of bureaucracy."
	icon_state = "hopformal_t"

/obj/item/clothing/head/beret/hop
	icon = 'dripstation/icons/obj/clothing/hats.dmi'	

/obj/item/clothing/suit/armor/vest/alt
	icon = 'dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/suits.dmi'	

/obj/item/clothing/glasses/hud/personnel
	icon = 'dripstation/icons/obj/clothing/eyes.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/eyes.dmi'
	lefthand_file = 'dripstation/icons/mob/inhands/glasses_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/glasses_righthand.dmi'	
	icon_state = "sunhudskill"
	item_state = "sunhudskill"

// ###### CAPTAIN ######
/obj/item/clothing/under/rank/captain
	icon = 'dripstation/icons/obj/clothing/uniform/command/captain.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/uniform/command/captain.dmi'

/obj/item/clothing/under/rank/captain/kilt
	desc = "Not a skirt, it is, however, armoured and decorated with a tartan sash."
	name = "captain's kilt"
	icon_state = "capkilt"
	item_state = "kilt"

/obj/item/clothing/under/rank/captain/dress
	name = "captain's dress"
	icon_state = "dress_cap_s"
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP	
	body_parts_covered = CHEST|GROIN|ARMS	
	mutantrace_variation = NO_MUTANTRACE_VARIATION	

/obj/item/clothing/suit/armor/vest/capcarapace
	icon = 'dripstation/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/suits.dmi'
	item_state = "capspacesuit"	

/obj/item/clothing/suit/armor/vest/capcarapace/alt
	icon = 'icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'icons/mob/clothing/suit/suit.dmi'

/obj/item/clothing/suit/armor/vest/capcarapace/tunic
	name = "captain's parade tunic"
	desc = "Worn by a Captain to show their class."
	icon_state = "captunic"

/obj/item/clothing/suit/armor/vest/capcarapace/tunic/white
	name = "captain's white tunic"
	icon_state = "captain_white"

/obj/item/clothing/suit/armor/vest/capcarapace/jacket
	name = "captain's jacket"
	icon_state = "capjacket"
	body_parts_covered = CHEST|ARMS

/obj/item/clothing/shoes/laceup/brown
	name = "brown laceup shoes"
	icon_state = "oxford_brown"
	item_state = "oxford_brown"
	icon = 'dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/shoes.dmi'
	lefthand_file = 'dripstation/icons/mob/inhands/shoes_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/shoes_righthand.dmi'	

/obj/item/clothing/shoes/laceup/grey
	name = "grey laceup shoes"
	icon_state = "oxford_grey"
	item_state = "oxford_grey"
	icon = 'dripstation/icons/obj/clothing/shoes.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/shoes.dmi'
	lefthand_file = 'dripstation/icons/mob/inhands/shoes_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/shoes_righthand.dmi'	

/obj/item/clothing/gloves/color/captain
	icon = 'dripstation/icons/obj/clothing/gloves.dmi'

/obj/item/clothing/head/caphat
	icon = 'dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/hats.dmi'	

/obj/item/clothing/head/caphat/formal
	name = "captain's formal cap"
	desc = "Worn only by Captains with an abundance of class."
	icon_state = "capcap"

/obj/item/clothing/head/beret/captain
	icon = 'dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/hats.dmi'	

/obj/item/clothing/head/caphat/parade
	icon = 'icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'icons/mob/clothing/head/head.dmi'

/obj/item/clothing/head/bearpelt
	name = "spare bear pelt"
	desc = "It shimmers in the light"
	icon_state = "sparebearpelt"
	icon = 'icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'icons/mob/clothing/head/head.dmi'	

/obj/item/clothing/mask/gas/captain
	name = "captain's gas mask"
	desc = "Nanotrasen cut corners and repainted a spare gas mask, but don't tell anyone."
	icon_state = "gas_cap"
	icon = 'dripstation/icons/obj/clothing/masks.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/masks.dmi'
	armor = list(MELEE = 5, BULLET = 5, LASER = 5, ENERGY = 5, BOMB = 0, BIO = 50, FIRE = 20, ACID = 10)
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/head/helmet/space/hardsuit/swat/captain
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR
	icon = 'dripstation/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'dripstation/icons/mob/clothing/hats.dmi'
	icon_state = "capspace0"
	basestate = "capspace"
	actions_types = list(/datum/action/item_action/toggle_helmet)

/obj/item/clothing/head/helmet/space/hardsuit/swat/captain/attack_self(mob/user)
	on = !on
	icon_state = "[basestate][on]"
	user.update_inv_head()	//so our mob-overlays update

	set_light_on(on)

	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/melee/sabre
	name = "captain's rapier"

/obj/item/storage/belt/sabre/attack_hand(mob/user)
	if(loc != user)
		return ..()

	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	if(H.incapacitated())
		return

	if(length(contents))
		var/obj/item/I = contents[1]
		H.visible_message("<span class='notice'>[H] takes [I] out of [src].</span>", "<span class='notice'>You take [I] out of [src].</span>")

		H.put_in_hands(I)
		playsound(I, 'dripstation/sound/weapons/blade_unsheath.ogg', 25, TRUE)
		update_icon()
	else
		to_chat(user, "<span class='warning'>[src] is empty!</span>")


