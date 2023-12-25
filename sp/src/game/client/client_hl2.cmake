# client_hl2.cmake

include("${CMAKE_CURRENT_LIST_DIR}/client_base.cmake")

set(CLIENT_HL2_DIR ${CMAKE_CURRENT_LIST_DIR})
set(
	CLIENT_HL2_SOURCE_FILES

	"${CLIENT_HL2_DIR}/hud_chat.cpp"
	"${CLIENT_HL2_DIR}/c_team_objectiveresource.cpp"
	"${CLIENT_HL2_DIR}/c_team_objectiveresource.h"

	# HL2 DLL
	"${SRCDIR}/game/shared/hl2/basehlcombatweapon_shared.cpp"
	"${SRCDIR}/game/shared/hl2/achievements_hl2.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_antlion_dust.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_ar2_explosion.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_barnacle.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_barney.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_basehelicopter.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_basehelicopter.h"
	"${CLIENT_HL2_DIR}/hl2/c_basehlcombatweapon.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_basehlcombatweapon.h"
	"${CLIENT_HL2_DIR}/hl2/c_basehlplayer.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_basehlplayer.h"
	"${CLIENT_HL2_DIR}/hl2/c_citadel_effects.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_corpse.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_corpse.h"
	"${CLIENT_HL2_DIR}/hl2/c_env_alyxtemp.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_env_headcrabcanister.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_env_starfield.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_func_tankmortar.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_hl2_playerlocaldata.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_hl2_playerlocaldata.h"
	"${CLIENT_HL2_DIR}/hl2/c_info_teleporter_countdown.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_npc_antlionguard.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_npc_combinegunship.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_npc_manhack.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_npc_rollermine.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_plasma_beam_node.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_prop_combine_ball.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_prop_combine_ball.h"
	"${CLIENT_HL2_DIR}/hl2/c_rotorwash.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_script_intro.cpp"
	"${SRCDIR}/game/shared/script_intro_shared.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_strider.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_te_concussiveexplosion.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_te_flare.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_thumper_dust.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_vehicle_airboat.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_vehicle_cannon.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_vehicle_crane.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_vehicle_crane.h"
	"${CLIENT_HL2_DIR}/hl2/c_vehicle_prisoner_pod.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_weapon__stubs_hl2.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_weapon_crossbow.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_weapon_physcannon.cpp"
	"${CLIENT_HL2_DIR}/hl2/c_weapon_stunstick.cpp"
	"${SRCDIR}/game/shared/hl2/citadel_effects_shared.h"
	"${CLIENT_HL2_DIR}/hl2/clientmode_hlnormal.cpp"
	"${CLIENT_HL2_DIR}/hl2/clientmode_hlnormal.h"
	"${CLIENT_HL2_DIR}/death.cpp"
	"${SRCDIR}/game/shared/hl2/env_headcrabcanister_shared.cpp"
	"${SRCDIR}/game/shared/hl2/env_headcrabcanister_shared.h"
	"${CLIENT_HL2_DIR}/hl2/fx_antlion.cpp"
	"${CLIENT_HL2_DIR}/hl2/fx_bugbait.cpp"
	"${CLIENT_HL2_DIR}/hl2/fx_hl2_impacts.cpp"
	"${CLIENT_HL2_DIR}/hl2/fx_hl2_tracers.cpp"
	"${CLIENT_HL2_DIR}/hl2/hl2_clientmode.cpp"
	"${SRCDIR}/game/shared/hl2/hl2_gamerules.cpp"
	"${SRCDIR}/game/shared/hl2/hl2_gamerules.h"
	"${SRCDIR}/game/shared/hl2/hl2_shareddefs.h"
	"${SRCDIR}/game/shared/hl2/hl2_usermessages.cpp"
	"${SRCDIR}/game/shared/hl2/hl_gamemovement.cpp"
	"${SRCDIR}/game/shared/hl2/hl_gamemovement.h"
	"${CLIENT_HL2_DIR}/hl2/hl_in_main.cpp"
	"${CLIENT_HL2_DIR}/hl2/hl_prediction.cpp"
	"${CLIENT_HL2_DIR}/hl2/hud_ammo.cpp"
	"${CLIENT_HL2_DIR}/hl2/hud_battery.cpp"
	"${CLIENT_HL2_DIR}/hl2/hud_blood.cpp"
	"${CLIENT_HL2_DIR}/hl2/hud_credits.cpp"
	"${CLIENT_HL2_DIR}/hl2/hud_damageindicator.cpp"
	"${CLIENT_HL2_DIR}/hl2/hud_flashlight.cpp"
	"${CLIENT_HL2_DIR}/hl2/hud_health.cpp"
	"${CLIENT_HL2_DIR}/hl2/hud_poisondamageindicator.cpp"
	"${CLIENT_HL2_DIR}/hud_posture.cpp"
	"${CLIENT_HL2_DIR}/hl2/hud_quickinfo.cpp"
	"${CLIENT_HL2_DIR}/hud_squadstatus.cpp"
	"${CLIENT_HL2_DIR}/hl2/hud_suitpower.cpp"
	"${CLIENT_HL2_DIR}/hl2/hud_suitpower.h"
	"${CLIENT_HL2_DIR}/hl2/hud_weaponselection.cpp"
	"${CLIENT_HL2_DIR}/hl2/hud_zoom.cpp"
	"${CLIENT_HL2_DIR}/hl2/shieldproxy.cpp"
	"${CLIENT_HL2_DIR}/hl2/vgui_rootpanel_hl2.cpp"
	"${CLIENT_HL2_DIR}/episodic/c_vort_charge_token.cpp"
)

set(
	CLIENT_HL2_EXCLUDE_SOURCES
)

add_library(client_hl2 MODULE ${CLIENT_HL2_SOURCE_FILES})

set_target_properties(
	client_hl2 PROPERTIES
	OUTPUT_NAME "client"
	PREFIX ""
	LIBRARY_OUTPUT_DIRECTORY "${GAMEDIR}/mod_hl2/bin"
	LIBRARY_OUTPUT_DIRECTORY_DEBUG "${GAMEDIR}/mod_hl2/bin"
	LIBRARY_OUTPUT_DIRECTORY_RELEASE "${GAMEDIR}/mod_hl2/bin"
)

target_include_directories(
	client_hl2 PRIVATE
	"${CLIENT_HL2_DIR}/hl2"
	"${CLIENT_HL2_DIR}/hl2/elements"
	"${SRCDIR}/game/shared/hl2"
)

target_use_client_base(client_hl2 CLIENT_HL2_EXCLUDE_SOURCES)

target_compile_definitions(
	client_hl2 PRIVATE
	HL2_CLIENT_DLL
)
