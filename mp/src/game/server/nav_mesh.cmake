# nav_mesh.cmake

include_guard(GLOBAL)

set(NAV_MESH_DIR ${CMAKE_CURRENT_LIST_DIR})
set(
	NAV_MESH_SOURCE_FILES
	"${NAV_MESH_DIR}/nav.h"
	"${NAV_MESH_DIR}/nav_area.cpp"
	"${NAV_MESH_DIR}/nav_area.h"
	"${NAV_MESH_DIR}/nav_colors.cpp"
	"${NAV_MESH_DIR}/nav_colors.h"
	"${NAV_MESH_DIR}/nav_edit.cpp"
	"${NAV_MESH_DIR}/nav_entities.cpp"
	"${NAV_MESH_DIR}/nav_entities.h"
	"${NAV_MESH_DIR}/nav_file.cpp"
	"${NAV_MESH_DIR}/nav_generate.cpp"
	"${NAV_MESH_DIR}/nav_ladder.cpp"
	"${NAV_MESH_DIR}/nav_ladder.h"
	"${NAV_MESH_DIR}/nav_merge.cpp"
	"${NAV_MESH_DIR}/nav_mesh.cpp"
	"${NAV_MESH_DIR}/nav_mesh.h"
	"${NAV_MESH_DIR}/nav_mesh_factory.cpp"
	"${NAV_MESH_DIR}/nav_node.cpp"
	"${NAV_MESH_DIR}/nav_node.h"
	"${NAV_MESH_DIR}/nav_pathfind.h"
	"${NAV_MESH_DIR}/nav_simplify.cpp"
)

function(target_use_nav_mesh target)
	target_sources(
		${target} PRIVATE
		${NAV_MESH_SOURCE_FILES}
	)
	target_compile_definitions(
		${target} PRIVATE
		USE_NAV_MESH
	)
endfunction()