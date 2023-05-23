
/obj/machinery/vending/cola
	name = "\improper Robust Softdrinks"
	desc = "A softdrink vendor provided by Robust Industries, LLC."
	icon_state = "Cola_Machine"
	icon_vend = "Cola_Machine-vend"
	icon_deny = "Cola_Machine-deny"	
	product_slogans = "Robust Softdrinks: More robust than a toolbox to the head!"
	product_ads = "Refreshing!;Hope you're thirsty!;Over 1 million drinks sold!;Thirsty? Why not cola?;Please, have a drink!;Drink up!;The best drinks in space.;Thats cheap ass soda!"
	products = list(/obj/item/reagent_containers/food/drinks/soda_cans/cola = 10,
		            /obj/item/reagent_containers/food/drinks/soda_cans/space_mountain_wind = 10,
					/obj/item/reagent_containers/food/drinks/soda_cans/dr_gibb = 10,
					/obj/item/reagent_containers/food/drinks/soda_cans/starkist = 10,
					/obj/item/reagent_containers/food/drinks/soda_cans/space_up = 10,
					/obj/item/reagent_containers/food/drinks/soda_cans/pwr_game = 10,
					/obj/item/reagent_containers/food/drinks/soda_cans/lemon_lime = 10,
					/obj/item/reagent_containers/food/drinks/soda_cans/sol_dry = 10,
					/obj/item/reagent_containers/food/drinks/soda_cans/rootbeer=10,
					/obj/item/reagent_containers/glass/beaker/waterbottle = 10)
	contraband = list(/obj/item/reagent_containers/food/drinks/soda_cans/thirteenloko = 6,
		              /obj/item/reagent_containers/food/drinks/soda_cans/shamblers = 6,
					  /obj/item/reagent_containers/food/drinks/soda_cans/buzz_fuzz = 5,
					  /obj/item/reagent_containers/food/drinks/soda_cans/mystery = 1,
		              /obj/item/reagent_containers/food/drinks/soda_cans/sprited_cranberry = 2)
	premium = list(/obj/item/reagent_containers/food/drinks/bottle/nukacola = 1,
		           /obj/item/reagent_containers/food/drinks/soda_cans/air = 1,
		           /obj/item/reagent_containers/food/drinks/soda_cans/monkey_energy = 1,
		           /obj/item/reagent_containers/food/drinks/soda_cans/grey_bull = 1)
	refill_canister = /obj/item/vending_refill/cola
	default_price = 2
	extra_price = 30
	payment_department = ACCOUNT_SRV
	light_mask = "cola-light-mask"	

/obj/item/vending_refill/cola
	machine_name = "Robust Softdrinks"
	icon_state = "refill_cola"

/obj/machinery/vending/cola/random
	name = "\improper Random Drinkies"
	icon_state = "random_cola"
	desc = "Uh oh!"

/obj/machinery/vending/cola/random/Initialize()
	..()
	var/T = pick(subtypesof(/obj/machinery/vending/cola) - /obj/machinery/vending/cola/random - /obj/machinery/vending/cola/shamblers/prison)
	new T(loc)
	return INITIALIZE_HINT_QDEL

/obj/machinery/vending/cola/blue
	icon_state = "Cola_Machine"

/obj/machinery/vending/cola/black
	icon_state = "cola_black"
	icon_vend = "cola_black-vend"
	icon_deny = "cola_black-deny"			
	light_mask = "cola_black-light-mask"	

/obj/machinery/vending/cola/red
	icon_state = "red_cola"
	icon_vend = "red_cola-vend"
	icon_deny = "red_cola-deny"		
	name = "\improper Space Cola Vendor"
	desc = "It vends cola, in space."
	product_slogans = "Cola in space!"
	light_mask = "red_cola-light-mask"		

/obj/machinery/vending/cola/space_up
	icon_state = "space_up"
	icon_vend = "space_up-vend"
	icon_deny = "space_up-deny"		
	name = "\improper Space-up! Vendor"
	desc = "Indulge in an explosion of flavor."
	product_slogans = "Space-up! Like a hull breach in your mouth."
	light_mask = "space_up-light-mask"		

/obj/machinery/vending/cola/starkist
	icon_state = "starkist"
	icon_vend = "starkist-vend"
	icon_deny = "starkist-deny"	
	light_color = LIGHT_COLOR_ORANGE
	name = "\improper Star-kist Vendor"
	desc = "The taste of a star in liquid form."
	product_slogans = "Drink the stars! Star-kist!"
	light_mask = "starkist-light-mask"		

/obj/machinery/vending/cola/sodie
	icon_state = "soda"
	icon_vend = "soda-vend"
	icon_deny = "soda-deny"
	light_mask = "starkist-light-mask"	

/obj/machinery/vending/cola/pwr_game
	icon_state = "pwr_game"
	icon_vend = "pwr_game-vend"
	icon_deny = "pwr_game-deny"
	name = "\improper Pwr Game Vendor"
	desc = "You want it, we got it. Brought to you in partnership with Vlad's Salads."
	product_slogans = "The POWER that gamers crave! PWR GAME!"
	light_mask = "pwr-light-mask"	

/obj/machinery/vending/cola/shamblers
	name = "\improper Shambler's Vendor"
	desc = "~Shake me up some of that Shambler's Juice!~"
	icon_state = "shamblers_juice"
	icon_vend = "shamblers_juice-vend"
	icon_deny = "shamblers_juice-deny"
	light_color = COLOR_MAGENTA
	products = list(/obj/item/reagent_containers/food/drinks/soda_cans/cola = 10,
		            /obj/item/reagent_containers/food/drinks/soda_cans/space_mountain_wind = 10,
					/obj/item/reagent_containers/food/drinks/soda_cans/dr_gibb = 10,
					/obj/item/reagent_containers/food/drinks/soda_cans/starkist = 10,
					/obj/item/reagent_containers/food/drinks/soda_cans/space_up = 10,
					/obj/item/reagent_containers/food/drinks/soda_cans/pwr_game = 10,
					/obj/item/reagent_containers/food/drinks/soda_cans/lemon_lime = 10,
					/obj/item/reagent_containers/food/drinks/soda_cans/shamblers = 10)
	product_slogans = "~Shake me up some of that Shambler's Juice!~"
	product_ads = "Refreshing!;Jyrbv dv lg jfdv fw kyrk Jyrdscvi'j Alztv!;Over 1 trillion souls drank!;Thirsty? Nyp efk uizeb kyv uribevjj?;Kyv Jyrdscvi uizebj kyv ezxyk!;Drink up!;Krjkp."
	light_mask = "shamblers-light-mask"

/obj/machinery/vending/cola/shamblers/prison
	products = list(/obj/item/reagent_containers/food/drinks/soda_cans/shamblers = 80)
	premium = list(/obj/item/reagent_containers/glass/bottle/water = 5)
	default_price = 0
	extra_price = 0
