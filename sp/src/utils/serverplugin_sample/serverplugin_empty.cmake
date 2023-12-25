# serverplugin_empty.cmake

set(SERVERPLUGIN_EMPTY_DIR ${CMAKE_CURRENT_LIST_DIR})
set(
	SERVERPLUGIN_EMPTY_SOURCE_FILES

	"${SERVERPLUGIN_EMPTY_DIR}/serverplugin_bot.cpp"
	"${SERVERPLUGIN_EMPTY_DIR}/serverplugin_empty.cpp"

	# Header Files
	"${SRCDIR}/public/tier0/basetypes.h"
	"${SRCDIR}/public/Color.h"
	"${SRCDIR}/public/tier0/dbg.h"
	"${SRCDIR}/public/eiface.h"
	"${SRCDIR}/public/filesystem.h"
	"${SRCDIR}/public/tier0/icommandline.h"
	"${SRCDIR}/public/igameevents.h"
	"${SRCDIR}/public/tier1/interface.h"
	"${SRCDIR}/public/game/server/iplayerinfo.h"
	"${SRCDIR}/public/engine/iserverplugin.h"
	"${SRCDIR}/public/tier1/KeyValues.h"
	"${SRCDIR}/public/tier0/mem.h"
	"${SRCDIR}/public/tier0/memalloc.h"
	"${SRCDIR}/public/tier0/memdbgon.h"
	"${SRCDIR}/public/tier1/strtools.h"
	"${SRCDIR}/public/tier1/utlbuffer.h"
	"${SRCDIR}/public/tier1/utlmemory.h"
	"${SRCDIR}/public/tier1/utlvector.h"
	"${SRCDIR}/public/vstdlib/vstdlib.h"
)

add_library(serverplugin_empty MODULE ${SERVERPLUGIN_EMPTY_SOURCE_FILES})

set_target_properties(
	serverplugin_empty
	PROPERTIES
	PREFIX ""
	LIBRARY_OUTPUT_DIRECTORY "${GAMEDIR}/bin"
)

target_include_directories(
	serverplugin_empty PRIVATE
	"${SRCDIR}/game/server"
	"${SRCDIR}/game/shared"
)

target_compile_definitions(
	serverplugin_empty PRIVATE
	serverplugin_emptyONLY
	_MBCS
)

target_link_libraries(
	serverplugin_empty PRIVATE
	mathlib
	"${LIBPUBLIC}/tier2${STATIC_LIB_EXT}"
)