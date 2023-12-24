# game_shader_dx9_base.cmake

include_guard(GLOBAL)

set(GAME_SHADER_DX9_BASE_DIR ${CMAKE_CURRENT_LIST_DIR})
set(
	GAME_SHADER_DX9_BASE_SOURCE_FILES
	"${GAME_SHADER_DX9_BASE_DIR}/BaseVSShader.cpp"

	"${GAME_SHADER_DX9_BASE_DIR}/example_model_dx9.cpp"
	"${GAME_SHADER_DX9_BASE_DIR}/example_model_dx9_helper.cpp"

	"${GAME_SHADER_DX9_BASE_DIR}/Bloom.cpp"
	"${GAME_SHADER_DX9_BASE_DIR}/screenspace_general.cpp"

	# Header Files
	"${GAME_SHADER_DX9_BASE_DIR}/BaseVSShader.h"
	"${GAME_SHADER_DX9_BASE_DIR}/common_fxc.h"
	"${GAME_SHADER_DX9_BASE_DIR}/common_hlsl_cpp_consts.h"
	"${GAME_SHADER_DX9_BASE_DIR}/common_ps_fxc.h"
	"${GAME_SHADER_DX9_BASE_DIR}/common_vertexlitgeneric_dx9.h"
	"${GAME_SHADER_DX9_BASE_DIR}/common_vs_fxc.h"
	"${GAME_SHADER_DX9_BASE_DIR}/shader_constant_register_map.h"

	"${GAME_SHADER_DX9_BASE_DIR}/example_model_dx9_helper.h"

	# Miscellaneous
	"${GAME_SHADER_DX9_BASE_DIR}/buildsdkshaders.bat"
	"${GAME_SHADER_DX9_BASE_DIR}/buildshaders.bat"

	"${GAME_SHADER_DX9_BASE_DIR}/stdshader_dx9_20b.txt"
	"${GAME_SHADER_DX9_BASE_DIR}/stdshader_dx9_30.txt"
)

function(target_use_game_shader_dx9_base target)
	target_sources(
		${target} PRIVATE
		${GAME_SHADER_DX9_BASE_SOURCE_FILES}
	)

	target_include_directories(
		${target} PRIVATE
		"${GAME_SHADER_DX9_BASE_DIR}/fxctmp9"
		"${GAME_SHADER_DX9_BASE_DIR}/vshtmp9"
	)

	target_compile_definitions(
		${target} PRIVATE
		STDSHADER_DX9_DLL_EXPORT
		FAST_MATERIALVAR_ACCESS
		GAME_SHADER_DLL
		$<$<NOT:${USE_GL}>:USE_ACTUAL_DX>
	)

	target_link_libraries(
		${target} PRIVATE
		"$<${IS_WINDOWS}:version;winmm>"
		mathlib
		"${LIBPUBLIC}/shaderlib${STATIC_LIB_EXT}"
	)
endfunction()