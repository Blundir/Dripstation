/obj/item/organ/cyberimp/eyes/hud
	name = "cybernetic hud"
	desc = "artificial photoreceptors with specialized functionality"
	icon_state = "eye_implant"
	implant_overlay = "eye_implant_overlay"
	slot = ORGAN_SLOT_EYES
	zone = BODY_ZONE_PRECISE_EYES
	w_class = WEIGHT_CLASS_TINY

// HUD implants
/obj/item/organ/cyberimp/eyes/hud
	name = "HUD implant"
	desc = "These cybernetic eyes will display a HUD over everything you see. Maybe."
	slot = ORGAN_SLOT_HUD
	var/HUD_type = 0

/obj/item/organ/cyberimp/eyes/hud/Insert(var/mob/living/carbon/M, var/special = 0, drop_if_replaced = FALSE)
	..()
	if(HUD_type)
		var/datum/atom_hud/H = GLOB.huds[HUD_type]
		H.show_to(M)

/obj/item/organ/cyberimp/eyes/hud/Remove(var/mob/living/carbon/M, var/special = 0)
	if(HUD_type)
		var/datum/atom_hud/H = GLOB.huds[HUD_type]
		H.hide_from(M)
	..()

/obj/item/organ/cyberimp/eyes/hud/medical
	name = "Medical HUD implant"
	desc = "These cybernetic eye implants will display a medical HUD over everything you see."
	HUD_type = DATA_HUD_MEDICAL_ADVANCED

/obj/item/organ/cyberimp/eyes/hud/security
	name = "Security HUD implant"
	desc = "These cybernetic eye implants will display a security HUD over everything you see."
	HUD_type = DATA_HUD_SECURITY_ADVANCED

/obj/item/organ/cyberimp/eyes/hud/diagnostic
	name = "Diagnostic HUD implant"
	desc = "These cybernetic eye implants will display a diagnostic HUD over everything you see."
	HUD_type = DATA_HUD_DIAGNOSTIC_ADVANCED

/obj/item/organ/cyberimp/eyes/hud/security/syndicate
	name = "Contraband Security HUD Implant"
	desc = "A Cybersun Industries brand Security HUD Implant. These illicit cybernetic eye implants will display a security HUD over everything you see."
	syndicate_implant = TRUE

/obj/item/organ/cyberimp/eyes/hud/science
	name = "Chemical Analyzer implant"
	desc = "These cybernetic eye implants will allow rapid identification of reagents."

/obj/item/organ/cyberimp/eyes/hud/science/Insert(var/mob/living/carbon/M, var/special = 0, drop_if_replaced = FALSE)
	..()
	ADD_TRAIT(owner, TRAIT_SEE_REAGENTS, src)

/obj/item/organ/cyberimp/eyes/hud/science/Remove(var/mob/living/carbon/M, var/special = 0)
	REMOVE_TRAIT(owner, TRAIT_SEE_REAGENTS, src)
	..()
