/obj/item/reagent_containers/food/condiment
	icon = 'dripstation/icons/obj/food/containers.dmi'
	lefthand_file = 'dripstation/icons/mob/inhands/kitchen_lefthand.dmi'
	righthand_file = 'dripstation/icons/mob/inhands/kitchen_righthand.dmi'
	item_state = "condiment"

/obj/item/reagent_containers/food/condiment/sugar
	name = "sugar sack"
	icon_state = "sugar"
	item_state = "sugar"	
	possible_states = list()

/obj/item/reagent_containers/food/condiment/ketchup
	name = "ketchup"
	desc = "A tomato slurry in a tall plastic bottle. Somehow still vaguely American."
	icon_state = "ketchup"
	item_state = "ketchup"	
	list_reagents = list(/datum/reagent/consumable/ketchup = 30)
	possible_states = list()

/obj/item/reagent_containers/food/condiment/ketchup/on_reagent_change(changetype)
	if(reagents.reagent_list.len == 0)
		icon_state = "ketchup_empty"		
	else
		icon_state = "ketchup"		

/obj/item/reagent_containers/food/condiment/coldsauce
	name = "cold sauce"
	desc = "Leaves the tongue numb in its passage."
	icon_state = "coldsauce"
	item_state = "coldsauce"	
	list_reagents = list(/datum/reagent/consumable/frostoil = 30)
	possible_states = list()

/obj/item/reagent_containers/food/condiment/hotsauce
	name = "hot sauce"
	desc = "You can almost TASTE the stomach ulcers now!"
	icon_state = "hotsauce"
	item_state = "hotsauce"	
	list_reagents = list(/datum/reagent/consumable/capsaicin = 30)
	possible_states = list()

/obj/item/reagent_containers/food/condiment/hotsauce/on_reagent_change(changetype)
	if(reagents.reagent_list.len == 0)
		icon_state = "hotsauce"
	else
		icon_state = "hotsauce_empty"

/obj/item/reagent_containers/food/condiment/cornoil
	name = "corn oil"
	desc = "A delicious oil used in cooking. Made from corn."
	icon_state = "cornoil"
	item_state = "cornoil"
	list_reagents = list(/datum/reagent/consumable/cornoil = 30)
	possible_states = list()

/obj/item/reagent_containers/food/condiment/cornoil/on_reagent_change(changetype)
	if(reagents.reagent_list.len == 0)
		icon_state = "cornoil_empty"
	else
		icon_state = "cornoil"		

/obj/item/reagent_containers/food/condiment/enzyme
	item_state = "enzyme"	

/obj/item/reagent_containers/food/condiment/enzyme/on_reagent_change(changetype)
	if(reagents.reagent_list.len == 0)
		icon_state = "enzyme_empty"
	else
		icon_state = "enzyme"		

/obj/item/reagent_containers/food/condiment/rice
	item_state = "rice"

/obj/item/reagent_containers/food/condiment/flour
	item_state = "flour"

/obj/item/reagent_containers/food/condiment/saltshaker
	item_state = "saltshakersmall"	

/obj/item/reagent_containers/food/condiment/saltshaker/on_reagent_change(changetype)
	if(reagents.reagent_list.len == 0)
		icon_state = "emptyshaker"
		item_state = "saltshakersmall_empty"		
	else
		icon_state = "saltshakersmall"	
		item_state = "saltshakersmall"

/obj/item/reagent_containers/food/condiment/cinnamon
	item_state = "cinnamonshaker"	

/obj/item/reagent_containers/food/condiment/cinnamon/on_reagent_change(changetype)
	if(reagents.reagent_list.len == 0)
		icon_state = "emptyshaker"
		item_state = "saltshakersmall_empty"		
	else
		icon_state = "cinnamonshaker"
		item_state = "cinnamonshaker"			

/datum/reagent/consumable/cinnamon
	taste_description = "sugary spice"

/obj/item/reagent_containers/food/condiment/milk
	item_state = "milk"

/obj/item/reagent_containers/food/condiment/soymilk
	item_state = "soymilk"

/obj/item/reagent_containers/food/condiment/soysauce
	item_state = "soysauce"

/obj/item/reagent_containers/food/condiment/soysauce/on_reagent_change(changetype)
	if(reagents.reagent_list.len == 0)
		icon_state = "soysauce_empty"	
	else
		icon_state = "soysauce"		

/obj/item/reagent_containers/food/condiment/mesophilic
	item_state = "mixedcondiments"

/obj/item/reagent_containers/food/condiment/pcandidum
	item_state = "mixedcondiments"

/obj/item/reagent_containers/food/condiment/proqueforti
	item_state = "mixedcondiments"

/obj/item/reagent_containers/food/condiment/thermophilic
	item_state = "mixedcondiments"

/obj/item/reagent_containers/food/condiment/peppermill
	item_state = "peppermillsmall"

/obj/item/reagent_containers/food/condiment/pack
	item_state = "condi_empty"
