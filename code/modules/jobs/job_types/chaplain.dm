/datum/job/chaplain
	title = "Chaplain"
	description = "Hold services and funerals, cremate people, preach your \
		religion, protect the crew against cults."
	flag = CHAPLAIN
	orbit_icon = "cross"
	department_head = list("Head of Personnel")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of personnel"
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/chaplain

	alt_titles = list("Priest", "Preacher", "Cleric", "Exorcist", "Vicar")

	added_access = list()
	base_access = list(ACCESS_MORGUE, ACCESS_CHAPEL_OFFICE, ACCESS_CREMATORIUM, ACCESS_THEATRE)
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_CIV

	display_order = JOB_DISPLAY_ORDER_CHAPLAIN
	minimal_character_age = 18 //My guy you are literally just a priest

	departments_list = list(
		/datum/job_department/service,
	)

	mail_goodies = list(
		/obj/item/reagent_containers/food/drinks/bottle/holywater = 30,
		/obj/item/toy/plush/awakenedplushie = 10,
		/obj/item/reagent_containers/food/condiment/saltshaker = 5,
		/obj/item/grenade/chem_grenade/holywater = 5, //holywater foam grenade
		/obj/item/toy/plush/narplush = 2,
		/obj/item/toy/plush/plushvar = 1,
		/obj/item/grenade/chem_grenade/holy = 1 //holy hand grenade
	)

	smells_like = "zealous fervor"


/datum/job/chaplain/after_spawn(mob/living/H, mob/M)
	. = ..()

	var/obj/item/storage/book/bible/booze/B = new

	if(GLOB.religion)
		if(H.mind)
			H.mind.holy_role = HOLY_ROLE_PRIEST
		B.deity_name = GLOB.deity
		B.name = GLOB.bible_name
		B.icon_state = GLOB.bible_icon_state
		B.item_state = GLOB.bible_item_state
		to_chat(H, "There is already an established religion onboard the station. You are an acolyte of [GLOB.deity]. Defer to the Chaplain.")
		H.equip_to_slot_or_del(B, SLOT_IN_BACKPACK)
		var/nrt = GLOB.holy_weapon_type || /obj/item/nullrod
		var/obj/item/nullrod/N = new nrt(H)
		if(GLOB.holy_weapon_type)
			N.reskinned = TRUE
		H.put_in_hands(N)
		if(GLOB.religious_sect)
			GLOB.religious_sect.on_conversion(H)
		return
	if(H.mind)
		H.mind.holy_role = HOLY_ROLE_HIGHPRIEST

	var/new_religion = M.client?.prefs?.read_preference(/datum/preference/name/religion) || DEFAULT_RELIGION
	var/new_deity = M.client?.prefs?.read_preference(/datum/preference/name/deity) || DEFAULT_DEITY

	B.deity_name = new_deity

	switch(lowertext(new_religion))
		if("christianity") // DEFAULT_RELIGION
			B.name = pick("The Holy Bible","The Dead Sea Scrolls")
		if("buddhism")
			B.name = "The Sutras"
		if("space dionysus","space bacchus, partying, servicia,")
			B.name = "The Tenets of Servicia"
			B.desc = "Happy, Full, Clean. Live it and give it."
		if("clownism","honkmother","honk","honkism","comedy")
			B.name = pick("The Holy Joke Book", "Just a Prank", "Hymns to the Honkmother")
		if("chaos")
			B.name = "The Book of Lorgar"
		if("cthulhu")
			B.name = "The Necronomicon"
		if("hinduism")
			B.name = "The Vedas"
		if("zoroastrianism")
			B.name = "The Avesta"
		if("homosexuality")
			B.name = pick("Guys Gone Wild","Coming Out of The Closet")
		if("imperium")
			B.name = "Uplifting Primer"
		if("islam")
			B.name = "Quran"
		if("judaism")
			B.name = "The Torah"
		if("lampism")
			B.name = "Fluorescent Incandescence"
		if("lol", "wtf", "gay", "penis", "ass", "poo", "badmin", "shitmin", "deadmin", "cock", "cocks", "meme", "memes")
			B.name = pick("Woodys Got Wood: The Aftermath", "War of the Cocks", "Sweet Bro and Hella Jef: Expanded Edition","F.A.T.A.L. Rulebook")
			H.adjustOrganLoss(ORGAN_SLOT_BRAIN, 100) // starts off retarded as fuck
		if("monkeyism","apism","gorillism","primatism")
			B.name = pick("Going Bananas", "Bananas Out For Harambe")
		if("mormonism")
			B.name = "The Book of Mormon"
		if("pastafarianism")
			B.name = "The Gospel of the Flying Spaghetti Monster"
		if("rastafarianism","rasta")
			B.name = "The Holy Piby"
		if("satanism")
			B.name = "The Unholy Bible"
		if("science")
			B.name = pick("Principle of Relativity", "Quantum Enigma: Physics Encounters Consciousness", "Programming the Universe", "Quantum Physics and Theology", "String Theory for Dummies", "How To: Build Your Own Warp Drive", "The Mysteries of Bluespace", "Playing God: Collector's Edition")
		if("scientology")
			B.name = pick("The Biography of L. Ron Hubbard","Dianetics")
		if("subgenius")
			B.name = "Book of the SubGenius"
		if("toolboxia","greytide")
			B.name = pick("Toolbox Manifesto","iGlove Assistants")
		if("weeaboo","kawaii")
			B.name = pick("Fanfiction Compendium","Japanese for Dummies","The Manganomicon","Establishing Your O.T.P")
		if("cult of the geometer")  //yogs start
			B.name = "Blood of the Geometer"
		if("plasmanimus")
			B.name = pick("Radioactive Bible", "Fusion Bible", "Atmosian Bible")
		if("beetism")
			B.name = "The Holy Book of Darth Beet"
		if("space christianity")
			B.name = "Space Jesus"
		if("space magicks")
			B.name = "Enchanted Bible"
		if("gondola")
			B.name = "The Gondola Manifesto"
		if("the bone lord")
			B.name = "The Bone Lord"
		if("church of aesthetic")
			B.name = "420Verses"
		if("the cult of lord singuloth")
			B.name = "The Word of Lord Singuloth"
		if("prethoryn scourge clan")
			B.name = "The Coming Storm"
		if("cult of the shroud")
			B.name = "End of the Cycle"
		if("fellowship of thanos")
			B.name = "Antmans Diary"
		if("metaism")
			B.name = "4th wall break"
		if("alletoidian")
			B.name = "station repair drone user manual"
		if("nugget")
			B.name = "A tenders tale"
		if("the holy flame","holy flame","okran")
			B.name = "The Holy Flame"
		if("egotism")
			B.name = "Marjes guide to robustness" //yogs end
		else
			B.name = "The Holy Book of [new_religion]"

	GLOB.religion = new_religion
	GLOB.bible_name = B.name
	GLOB.deity = B.deity_name

	H.equip_to_slot_or_del(B, SLOT_IN_BACKPACK)

	SSblackbox.record_feedback("text", "religion_name", 1, "[new_religion]", 1)
	SSblackbox.record_feedback("text", "religion_deity", 1, "[new_deity]", 1)

/datum/outfit/job/chaplain
	name = "Chaplain"
	jobtype = /datum/job/chaplain

	pda_type = /obj/item/modular_computer/tablet/pda/preset/basic/chap

	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/chaplain
	uniform_skirt = /obj/item/clothing/under/rank/chaplain/skirt
	backpack_contents = list(/obj/item/camera/spooky = 1)
	backpack = /obj/item/storage/backpack/cultpack
	satchel = /obj/item/storage/backpack/cultpack
