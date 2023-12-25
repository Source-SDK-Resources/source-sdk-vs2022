# vrad_launcher.cmake

set(VRAD_LAUNCHER_DIR ${CMAKE_CURRENT_LIST_DIR})
set(
	VRAD_LAUNCHER_SOURCE_FILES

	"${VRAD_LAUNCHER_DIR}/vrad_launcher.cpp"
	"${VRAD_LAUNCHER_DIR}/StdAfx.cpp"

	# Header Files
	"${SRCDIR}/public/tier1/interface.h"
	"${SRCDIR}/public/ivraddll.h"
	"${VRAD_LAUNCHER_DIR}/StdAfx.h"
)

set(
	vrad_launcher_exclude_source
	"${SRCDIR}/public/tier0/memoverride.cpp"
)

add_executable(vrad_launcher ${VRAD_LAUNCHER_SOURCE_FILES})

set_target_properties(
	vrad_launcher PROPERTIES
	RUNTIME_OUTPUT_DIRECTORY "${GAMEDIR}/bin"
)

target_precompile_headers(
	vrad_launcher PRIVATE
	"${VRAD_LAUNCHER_DIR}/stdafx.h"
)

target_link_options(
	vrad_launcher PRIVATE
)