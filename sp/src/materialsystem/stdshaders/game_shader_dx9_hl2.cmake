# game_shader_dx9_hl2.cmake

include( "${CMAKE_CURRENT_LIST_DIR}/game_shader_dx9_base.cmake")

add_library(game_shader_dx9_hl2 MODULE)

set_target_properties(
	game_shader_dx9_hl2 PROPERTIES
	PREFIX ""
	LIBRARY_OUTPUT_DIRECTORY "${GAMEDIR}/mod_hl2/bin"
)

target_use_game_shader_dx9_base(game_shader_dx9_hl2)