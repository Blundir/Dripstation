///Called from a cleaning tool to start cleaning something.
#define COMSIG_START_CLEANING "start_cleaning"

/// Marks an atom when the cleaning of it is first started, so that the cleaning overlay doesn't get removed prematurely
#define CURRENTLY_CLEANING "currently_cleaning"

GLOBAL_DATUM_INIT(cleaning_bubbles, /mutable_appearance, mutable_appearance('dripstation/icons/obj/effects/effects.dmi', "bubbles", FLOOR_CLEAN_LAYER, GAME_PLANE)) //displays at the top of floor tiles, but under mobs

/**
 * Component that can be used to clean things.
 * Takes care of duration and special cleaning interactions.
 * A callback can be set by the datum holding the cleaner to add custom functionality.
 * Soap uses a callback to decrease the amount of uses it has left after cleaning for example.
 */
/datum/component/cleaner
	/// The time it takes to clean something.
	var/cleaning_duration
	/// Determines what this cleaner can wash off, [the available options are found here](code/__DEFINES/cleaning.html).
	var/cleaning_strength
	/// Gets called when something is successfully cleaned.
	var/datum/callback/on_cleaned_callback

/datum/component/cleaner/Initialize(
	cleaning_duration = 3 SECONDS,
	cleaning_strength = CLEAN_SCRUB,
	datum/callback/on_cleaned_callback = null,
)
	src.cleaning_duration = cleaning_duration
	src.cleaning_strength = cleaning_strength
	src.on_cleaned_callback = on_cleaned_callback

/datum/component/cleaner/Destroy(force, silent)
	if(on_cleaned_callback)
		QDEL_NULL(on_cleaned_callback)
	return ..()

/datum/component/cleaner/RegisterWithParent()
	RegisterSignal(parent, COMSIG_START_CLEANING, .proc/on_start_cleaning)

/datum/component/cleaner/UnregisterFromParent()
	UnregisterSignal(parent, COMSIG_START_CLEANING)

/**
 * Handles the COMSIG_START_CLEANING signal by calling the clean proc.
 *
 * Arguments
 * * source the datum that sent the signal to start cleaning
 * * target the thing being cleaned
 * * user the person doing the cleaning
 * * clean_target set this to false if the target should not be washed
 */
/datum/component/cleaner/proc/on_start_cleaning(datum/source, atom/target, mob/living/user, clean_target)
	SIGNAL_HANDLER
	INVOKE_ASYNC(src, .proc/clean, source, target, user, clean_target) //signal handlers can't have do_afters inside of them

/**
 * Cleans something using this cleaner.
 * The cleaning duration is modified by the cleaning skill of the user.
 * Successfully cleaning gives cleaning experience to the user and invokes the on_cleaned_callback.
 *
 * Arguments
 * * source the datum that sent the signal to start cleaning
 * * target the thing being cleaned
 * * user the person doing the cleaning
 * * clean_target set this to false if the target should not be washed
 */
/datum/component/cleaner/proc/clean(datum/source, atom/target, mob/living/user, clean_target = TRUE)
//add the cleaning overlay
	//make sure we don't attempt to clean something while it's already being cleaned
	if(HAS_TRAIT(target, CURRENTLY_CLEANING))
		return
		//add the trait and overlay
	ADD_TRAIT(target, CURRENTLY_CLEANING, src)
	target.add_overlay(GLOB.cleaning_bubbles)
	//set the cleaning duration
	var/duration = cleaning_duration 
	//do the cleaning
	user.visible_message(span_notice("[user] starts to clean [target]!"), span_notice("You start to clean [target]..."))
	if(do_after(user, duration, target = target))
		user.visible_message(span_notice("[user] finishes cleaning [target]!"), span_notice("You finish cleaning [target]."))
		if(clean_target)
			for(var/obj/effect/decal/cleanable/cleanable_decal in target) //it's important to do this before you wash all of the cleanables off
			if(istype(target, /obj/structure/window)) //window cleaning
				target.set_opacity(initial(target.opacity))
				target.remove_atom_colour(WASHABLE_COLOUR_PRIORITY)
				var/obj/structure/window/window = target
				if(window.bloodied)
					for(var/obj/effect/decal/cleanable/blood/iter_blood in window)
						window.vis_contents -= iter_blood
						qdel(iter_blood)
						window.bloodied = FALSE
			target.wash(cleaning_strength)
			target.cut_overlay(GLOB.cleaning_bubbles)
			REMOVE_TRAIT(target, CURRENTLY_CLEANING, src)
	else
		on_cleaned_callback?.Invoke(source, target, user, clean_target)
		target.cut_overlay(GLOB.cleaning_bubbles)
		REMOVE_TRAIT(target, CURRENTLY_CLEANING, src)
/**
 * Starts cleaning something by sending the COMSIG_START_CLEANING signal.
 * This signal is received by the [cleaner component](code/datums/components/cleaner.html).
 *
 * Arguments
 * * source the datum to send the signal from
 * * target the thing being cleaned
 * * user the person doing the cleaning
 * * clean_target set this to false if the target should not be washed and if experience should not be awarded to the user
 */
/atom/proc/start_cleaning(datum/source, atom/target, mob/living/user, clean_target = TRUE)
	SEND_SIGNAL(source, COMSIG_START_CLEANING, target, user, clean_target)
