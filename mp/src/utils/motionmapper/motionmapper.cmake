# motionmapper.cmake

set(MOTIONMAPPER_DIR ${CMAKE_CURRENT_LIST_DIR})
set(
	MOTIONMAPPER_SOURCE_FILES

	"${SRCDIR}/utils/common/cmdlib.cpp"
	"${SRCDIR}/public/filesystem_helpers.cpp"
	"${SRCDIR}/public/filesystem_init.cpp"
	"${SRCDIR}/utils/common/filesystem_tools.cpp"
	"${MOTIONMAPPER_DIR}/motionmapper.cpp"
	"${SRCDIR}/utils/common/scriplib.cpp"

	# Header Files
	"${SRCDIR}/public/mathlib/amd3dx.h"
	"${SRCDIR}/public/tier0/basetypes.h"
	"${SRCDIR}/public/tier1/characterset.h"
	"${SRCDIR}/utils/common/cmdlib.h"
	"${SRCDIR}/public/Color.h"
	"${SRCDIR}/public/tier0/commonmacros.h"
	"${SRCDIR}/public/mathlib/compressed_vector.h"
	"${SRCDIR}/public/tier0/dbg.h"
	"${SRCDIR}/public/tier0/fasttimer.h"
	"${SRCDIR}/public/filesystem.h"
	"${SRCDIR}/public/filesystem_helpers.h"
	"${SRCDIR}/utils/common/filesystem_tools.h"
	"${SRCDIR}/public/appframework/IAppSystem.h"
	"${SRCDIR}/public/tier0/icommandline.h"
	"${SRCDIR}/public/vstdlib/IKeyValuesSystem.h"
	"${SRCDIR}/public/tier1/interface.h"
	"${SRCDIR}/public/tier1/KeyValues.h"
	"${SRCDIR}/public/mathlib/mathlib.h"
	"${SRCDIR}/public/tier0/mem.h"
	"${SRCDIR}/public/tier0/memalloc.h"
	"${SRCDIR}/public/tier0/memdbgoff.h"
	"${SRCDIR}/public/tier0/memdbgon.h"
	"${MOTIONMAPPER_DIR}/motionmapper.h"
	"${SRCDIR}/public/tier0/platform.h"
	"${SRCDIR}/public/tier0/protected_things.h"
	"${SRCDIR}/utils/common/scriplib.h"
	"${SRCDIR}/public/string_t.h"
	"${SRCDIR}/public/tier1/strtools.h"
	"${SRCDIR}/public/studio.h"
	"${SRCDIR}/public/tier1/utlbuffer.h"
	"${SRCDIR}/public/tier1/utldict.h"
	"${SRCDIR}/public/tier1/utllinkedlist.h"
	"${SRCDIR}/public/tier1/utlmemory.h"
	"${SRCDIR}/public/tier1/utlrbtree.h"
	"${SRCDIR}/public/tier1/utlsymbol.h"
	"${SRCDIR}/public/tier1/utlvector.h"
	"${SRCDIR}/public/mathlib/vector.h"
	"${SRCDIR}/public/mathlib/vector2d.h"
	"${SRCDIR}/public/mathlib/vector4d.h"
	"${SRCDIR}/public/vstdlib/vstdlib.h"
)

add_executable(motionmapper ${MOTIONMAPPER_SOURCE_FILES})

set_target_properties(
	motionmapper PROPERTIES
	RUNTIME_OUTPUT_DIRECTORY "${GAMEDIR}/bin"
)

target_include_directories(
	motionmapper PRIVATE
	"${SRCDIR}/utils/common"
	"${SRCDIR}/utils/nvtristriplib"
)

target_compile_definitions(
	motionmapper PRIVATE
	PROTECTED_THINGS_DISABLE
)

target_link_libraries(
	motionmapper PRIVATE
	winmm
	mathlib
	"${LIBPUBLIC}/nvtristrip${STATIC_LIB_EXT}"
	"${LIBPUBLIC}/tier2${STATIC_LIB_EXT}"
)