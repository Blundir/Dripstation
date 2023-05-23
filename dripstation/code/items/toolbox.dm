/obj/item/storage/toolbox/surgery
	name = "surgery kit"
	desc = "Contains tools for surgery. Has precise foam fitting for safe transport."
	icon_state = "surgerykit"
	item_state = "firstaid-surgery"
	lefthand_file = 'dripstation/icons/mob/inhands/boxes_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/boxes_righthand.dmi'		
	has_latches = FALSE
	material_flags = MATERIAL_NO_COLOR	

/obj/item/storage/toolbox/syndicate/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_combined_w_class = 21
	STR.max_items = 14
	var/static/list/can_hold = typecacheof(list(
		/obj/item/scalpel,
		/obj/item/hemostat,
		/obj/item/retractor,
		/obj/item/circular_saw,
		/obj/item/bonesetter,
		/obj/item/surgicaldrill,
		/obj/item/cautery,
		/obj/item/stack/medical/bone_gel,
		/obj/item/implantcase,
		/obj/item/surgical_drapes,
		/obj/item/stack/medical/bruise_pack,
		/obj/item/reagent_containers/syringe,
		/obj/item/reagent_containers/medspray/sterilizine,
		))
	STR.can_hold = can_hold

/obj/item/storage/toolbox/surgery/full/PopulateContents()
	new /obj/item/scalpel(src)
	new /obj/item/hemostat(src)
	new /obj/item/retractor(src)
	new /obj/item/circular_saw(src)
	new /obj/item/bonesetter(src)
	new /obj/item/surgicaldrill(src)
	new /obj/item/cautery(src)
	new /obj/item/reagent_containers/medspray/sterilizine(src)
