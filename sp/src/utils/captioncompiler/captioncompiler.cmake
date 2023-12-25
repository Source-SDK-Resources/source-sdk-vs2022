# captioncompiler.cmake

set(CAPTIONCOMPILER_DIR ${CMAKE_CURRENT_LIST_DIR})
set(
	CAPTIONCOMPILER_SOURCE_FILES

	"${CAPTIONCOMPILER_DIR}/captioncompiler.cpp"
	"${SRCDIR}/common/compiledcaptionswap.cpp"
	"${SRCDIR}/utils/common/filesystem_tools.cpp"

	# Header Files
	"${CAPTIONCOMPILER_DIR}/cbase.h"
	"${SRCDIR}/utils/common/filesystem_tools.h"

	# Shared Code
	"${SRCDIR}/utils/common/cmdlib.cpp"
	"${SRCDIR}/utils/common/cmdlib.h"
	"${SRCDIR}/public/filesystem_helpers.cpp"
	"${SRCDIR}/public/filesystem_helpers.h"
	"${SRCDIR}/public/filesystem_init.cpp"
	"${SRCDIR}/public/filesystem_init.h"
	"${SRCDIR}/public/mathlib/mathlib.h"
	"${SRCDIR}/utils/common/pacifier.cpp"
	"${SRCDIR}/utils/common/pacifier.h"
	"${SRCDIR}/utils/common/scriplib.cpp"
	"${SRCDIR}/utils/common/scriplib.h"
	"${SRCDIR}/public/stringregistry.cpp"
	"${SRCDIR}/public/stringregistry.h"
)

add_executable(captioncompiler ${CAPTIONCOMPILER_SOURCE_FILES})

set_target_properties(
	captioncompiler PROPERTIES
	RUNTIME_OUTPUT_DIRECTORY "${GAMEDIR}/bin"
)

target_compile_definitions(
	captioncompiler PRIVATE
	captioncompiler
)

target_include_directories(
	captioncompiler PRIVATE
	"${SRCDIR}/utils/common"
	"${SRCDIR}/game/shared"
	"${CAPTIONCOMPILER_DIR}"
)

target_link_libraries(
	captioncompiler PRIVATE
	"${LIBPUBLIC}/appframework${STATIC_LIB_EXT}"
	mathlib
	"${LIBPUBLIC}/tier2${STATIC_LIB_EXT}"
	"${LIBPUBLIC}/tier3${STATIC_LIB_EXT}"
)