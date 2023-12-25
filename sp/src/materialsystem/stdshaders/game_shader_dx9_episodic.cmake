# game_shader_dx9_episodic.cmake

include( "${CMAKE_CURRENT_LIST_DIR}/game_shader_dx9_base.cmake")

add_library(game_shader_dx9_episodic MODULE)

set_target_properties(
	game_shader_dx9_episodic PROPERTIES
	PREFIX ""
	LIBRARY_OUTPUT_DIRECTORY "${GAMEDIR}/mod_episodic/bin"
)

target_use_game_shader_dx9_base(game_shader_dx9_episodic)