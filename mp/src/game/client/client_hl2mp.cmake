# client_hl2mp.cmake

include("${CMAKE_CURRENT_LIST_DIR}/client_base.cmake")

set(CLIENT_HL2MP_DIR ${CMAKE_CURRENT_LIST_DIR})
set(
	CLIENT_HL2MP_SOURCE_FILES

	# Source Files
	"${CLIENT_HL2MP_DIR}/c_team_objectiveresource.cpp"
	"${CLIENT_HL2MP_DIR}/c_team_objectiveresource.h"
	"${CLIENT_HL2MP_DIR}/c_team_train_watcher.cpp"
	"${CLIENT_HL2MP_DIR}/c_team_train_watcher.h"
	"${CLIENT_HL2MP_DIR}/hud_voicestatus.cpp"
	"${SRCDIR}/game/shared/predicted_viewmodel.cpp"
	"${SRCDIR}/game/shared/predicted_viewmodel.h"
	"${SRCDIR}/game/shared/teamplay_round_timer.cpp"
	"${SRCDIR}/game/shared/teamplay_round_timer.h"

	# HL2 DLL
	"${CLIENT_HL2MP_DIR}/episodic/c_vort_charge_token.cpp"
	"${SRCDIR}/game/shared/hl2/basehlcombatweapon_shared.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_antlion_dust.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_ar2_explosion.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_barnacle.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_barney.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_basehelicopter.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_basehelicopter.h"
	"${CLIENT_HL2MP_DIR}/hl2/c_basehlcombatweapon.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_basehlcombatweapon.h"
	"${CLIENT_HL2MP_DIR}/hl2/c_basehlplayer.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_basehlplayer.h"
	"${CLIENT_HL2MP_DIR}/hl2/c_citadel_effects.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_corpse.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_corpse.h"
	"${CLIENT_HL2MP_DIR}/hl2/c_env_alyxtemp.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_env_headcrabcanister.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_env_starfield.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_func_tankmortar.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_hl2_playerlocaldata.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_hl2_playerlocaldata.h"
	"${CLIENT_HL2MP_DIR}/hl2/c_info_teleporter_countdown.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_npc_antlionguard.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_npc_combinegunship.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_npc_manhack.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_npc_rollermine.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_plasma_beam_node.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_prop_combine_ball.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_prop_combine_ball.h"
	"${CLIENT_HL2MP_DIR}/hl2/c_rotorwash.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_script_intro.cpp"
	"${SRCDIR}/game/shared/script_intro_shared.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_strider.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_te_concussiveexplosion.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_te_flare.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_thumper_dust.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_vehicle_airboat.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_vehicle_cannon.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_vehicle_crane.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_vehicle_crane.h"
	"${CLIENT_HL2MP_DIR}/hl2/c_vehicle_prisoner_pod.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_weapon__stubs_hl2.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/c_weapon_crossbow.cpp"
	"${SRCDIR}/game/shared/hl2/citadel_effects_shared.h"
	"${SRCDIR}/game/shared/hl2/env_headcrabcanister_shared.cpp"
	"${SRCDIR}/game/shared/hl2/env_headcrabcanister_shared.h"
	"${CLIENT_HL2MP_DIR}/hl2/fx_antlion.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/fx_bugbait.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/fx_hl2_impacts.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/fx_hl2_tracers.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/hl2_clientmode.cpp"
	"${SRCDIR}/game/shared/hl2/hl2_gamerules.cpp"
	"${SRCDIR}/game/shared/hl2/hl2_gamerules.h"
	"${SRCDIR}/game/shared/hl2/hl2_shareddefs.h"
	"${SRCDIR}/game/shared/hl2/hl2_usermessages.cpp"
	"${SRCDIR}/game/shared/hl2/hl_gamemovement.cpp"
	"${SRCDIR}/game/shared/hl2/hl_gamemovement.h"
	"${CLIENT_HL2MP_DIR}/hl2/hl_in_main.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/hl_prediction.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/hud_ammo.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/hud_battery.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/hud_blood.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/hud_credits.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/hud_damageindicator.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/hud_flashlight.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/hud_health.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/hud_poisondamageindicator.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/hud_quickinfo.cpp"
	"${CLIENT_HL2MP_DIR}/hud_squadstatus.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/hud_suitpower.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/hud_suitpower.h"
	"${CLIENT_HL2MP_DIR}/hl2/hud_weaponselection.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/hud_zoom.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/shieldproxy.cpp"
	"${CLIENT_HL2MP_DIR}/hl2/vgui_rootpanel_hl2.cpp"

	# HL2MP
	"${CLIENT_HL2MP_DIR}/hl2mp/c_hl2mp_player.cpp"
	"${CLIENT_HL2MP_DIR}/hl2mp/c_hl2mp_player.h"
	"${CLIENT_HL2MP_DIR}/hl2mp/c_te_hl2mp_shotgun_shot.cpp"
	"${CLIENT_HL2MP_DIR}/hl2mp/clientmode_hl2mpnormal.cpp"
	"${CLIENT_HL2MP_DIR}/hl2mp/clientmode_hl2mpnormal.h"
	"${SRCDIR}/game/shared/hl2mp/hl2mp_gamerules.cpp"
	"${SRCDIR}/game/shared/hl2mp/hl2mp_gamerules.h"
	"${SRCDIR}/game/shared/hl2mp/hl2mp_player_shared.cpp"
	"${SRCDIR}/game/shared/hl2mp/hl2mp_player_shared.h"
	"${SRCDIR}/game/shared/hl2mp/hl2mp_weapon_parse.cpp"
	"${SRCDIR}/game/shared/hl2mp/hl2mp_weapon_parse.h"

	# HL2MP->Weapons
	"${SRCDIR}/game/shared/hl2mp/weapon_357.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_ar2.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_ar2.h"
	"${SRCDIR}/game/shared/hl2mp/weapon_crossbow.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_crowbar.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_frag.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_hl2mpbase.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_hl2mpbase.h"
	"${SRCDIR}/game/shared/hl2mp/weapon_hl2mpbase_machinegun.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_hl2mpbase_machinegun.h"
	"${SRCDIR}/game/shared/hl2mp/weapon_hl2mpbasebasebludgeon.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_hl2mpbasehlmpcombatweapon.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_hl2mpbasehlmpcombatweapon.h"
	"${SRCDIR}/game/shared/hl2mp/weapon_physcannon.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_physcannon.h"
	"${SRCDIR}/game/shared/hl2mp/weapon_pistol.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_rpg.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_rpg.h"
	"${SRCDIR}/game/shared/hl2mp/weapon_shotgun.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_slam.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_slam.h"
	"${SRCDIR}/game/shared/hl2mp/weapon_smg1.cpp"
	"${SRCDIR}/game/shared/hl2mp/weapon_stunstick.cpp"

	# HL2MP->UI
	"${CLIENT_HL2MP_DIR}/hl2mp/ui/backgroundpanel.cpp"
	"${CLIENT_HL2MP_DIR}/hl2mp/ui/backgroundpanel.h"
	"${CLIENT_HL2MP_DIR}/hl2mp/hl2mp_hud_chat.cpp"
	"${CLIENT_HL2MP_DIR}/hl2mp/hl2mp_hud_chat.h"
	"${CLIENT_HL2MP_DIR}/hl2mp/hl2mp_hud_target_id.cpp"
	"${CLIENT_HL2MP_DIR}/hl2mp/hl2mp_hud_team.cpp"
	"${CLIENT_HL2MP_DIR}/hl2mp/ui/hl2mpclientscoreboard.cpp"
	"${CLIENT_HL2MP_DIR}/hl2mp/ui/hl2mpclientscoreboard.h"
	"${CLIENT_HL2MP_DIR}/hl2mp/ui/hl2mptextwindow.cpp"
	"${CLIENT_HL2MP_DIR}/hl2mp/ui/hl2mptextwindow.h"
	"${CLIENT_HL2MP_DIR}/hl2mp/hud_deathnotice.cpp"
)

set(
	CLIENT_HL2MP_EXCLUDE_SOURCES
	"${SRCDIR}/game/shared/weapon_parse_default.cpp"
)

add_library(client_hl2mp MODULE ${CLIENT_HL2MP_SOURCE_FILES})

set_target_properties(
	client_hl2mp PROPERTIES
	OUTPUT_NAME "client"
	PREFIX ""
	LIBRARY_OUTPUT_DIRECTORY "${GAMEDIR}/mod_hl2mp/bin"
)

target_use_client_base(client_hl2mp CLIENT_HL2MP_EXCLUDE_SOURCES)

target_include_directories(
	client_hl2mp PRIVATE
	"${CLIENT_HL2MP_DIR}/hl2mp/ui"
	"${CLIENT_HL2MP_DIR}/hl2mp"
	"${SRCDIR}/game/shared/hl2mp"
	"${CLIENT_HL2MP_DIR}/hl2"
	"${CLIENT_HL2MP_DIR}/hl2/elements"
	"${SRCDIR}/game/shared/hl2"
)

target_compile_definitions(
	client_hl2mp PRIVATE
	HL2MP
	HL2_CLIENT_DLL
)