/obj/machinery/vending/dinnerware
	name = "\improper Plasteel Chef's Dinnerware Vendor"
	desc = "A kitchen and restaurant equipment vendor."
	product_ads = "Mm, food stuffs!;Food and food accessories.;Get your plates!;You like forks?;I like forks.;Woo, utensils.;You don't really need these..."
	icon_state = "dinnerware"
	icon_vend = "dinnerware-vend"
	icon_deny = "dinnerware-deny"
	products = list(/obj/item/storage/bag/tray = 8,
					/obj/item/reagent_containers/glass/bowl = 20,
					/obj/item/kitchen/fork = 6,
					/obj/item/reagent_containers/food/drinks/drinkingglass = 8,
					/obj/item/reagent_containers/food/condiment/pack/ketchup = 5,
					/obj/item/reagent_containers/food/condiment/pack/hotsauce = 5,
					/obj/item/reagent_containers/food/condiment/pack/astrotame = 5,
					/obj/item/reagent_containers/food/condiment/saltshaker = 5,
					/obj/item/reagent_containers/food/condiment/peppermill = 5,
					/obj/item/clothing/suit/apron/chef = 2,
					/obj/item/kitchen/rollingpin = 2,
					/obj/item/kitchen/knife = 2,
					/obj/item/reagent_containers/glass/mixbowl = 3, // Yogs -- chef's mixing bowl 
					/obj/item/reagent_containers/food/condiment/cinnamon = 5, // Yogs -- cinnamon shakers!
					/obj/item/plate = 10) 
	contraband = list(/obj/item/kitchen/knife/butcher = 2,
					  /obj/item/melee/fryingpan = 2,	// Yogs -- Pan
					  /obj/item/twohanded/bigspoon = 2, // Yogs -- Big spoon
					  ) 
	refill_canister = /obj/item/vending_refill/dinnerware
	default_price = 5
	extra_price = 50
	req_access = list(ACCESS_KITCHEN)
	payment_department = ACCOUNT_SRV
	light_mask = "dinnerware-light-mask"	

/obj/item/vending_refill/dinnerware
	machine_name = "Plasteel Chef's Dinnerware Vendor"
	icon_state = "refill_smoke"
