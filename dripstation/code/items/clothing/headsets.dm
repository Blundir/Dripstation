/obj/item/radio/headset/heads/captain
	icon_state = "cap_headset"

/obj/item/radio/headset/heads/captain/alt
	icon_state = "cap_headset_alt"

/obj/item/radio/headset/heads/rd
	icon_state = "rd_headset"

/obj/item/radio/headset/heads/hos
	icon_state = "hos_headset"

/obj/item/radio/headset/heads/hos/alt
	icon_state = "hos_headset_alt"

/obj/item/radio/headset/heads/ce
	icon_state = "ce_headset"

/obj/item/radio/headset/heads/cmo
	icon_state = "cmo_headset"

/obj/item/radio/headset/heads/hop
	icon_state = "hop_headset"

/obj/item/radio/headset/headset_cargo
	desc = "A headset used by the slaves of Quartermaster."

/obj/item/encryptionkey/heads/qm
	name = "\proper the quartermaster's encryption key"
	icon_state = "qm_cypherkey"
	channels = list(RADIO_CHANNEL_SUPPLY = 1, RADIO_CHANNEL_COMMAND = 1)

/obj/item/radio/headset/heads/qm
	name = "the quartermaster's headset"
	desc = "The headset of the famous illegal weapons trader."
	icon_state = "qm_headset"
	keyslot = new /obj/item/encryptionkey/heads/qm

