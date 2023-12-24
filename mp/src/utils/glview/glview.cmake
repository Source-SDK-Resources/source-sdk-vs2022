# glview.cmake

set(GLVIEW_DIR ${CMAKE_CURRENT_LIST_DIR})
set(
	GLVIEW_SOURCE_FILES

	"${GLVIEW_DIR}/glview.cpp"

	# Common Files
	"${SRCDIR}/utils/common/cmdlib.cpp"
	"${SRCDIR}/public/filesystem_helpers.cpp"
	"${SRCDIR}/public/filesystem_init.cpp"
	"${SRCDIR}/utils/common/filesystem_tools.cpp"
	"${SRCDIR}/utils/common/physdll.cpp"

	# Header Files
	"${SRCDIR}/utils/common/cmdlib.h"
	"${GLVIEW_DIR}/glos.h"
	"${SRCDIR}/public/mathlib/mathlib.h"
)

add_executable(glview WIN32 ${GLVIEW_SOURCE_FILES})

set_target_properties(
	glview PROPERTIES
	RUNTIME_OUTPUT_DIRECTORY "${GAMEDIR}/bin"
)

target_include_directories(
	glview PRIVATE
	"${SRCDIR}/utils/common"
)

target_compile_definitions(
	glview PRIVATE
	PROTECTED_THINGS_DISABLE
)

target_link_libraries(
	glview PRIVATE

	glu32
	opengl32
	odbc32
	odbccp32
	winmm

	mathlib
	"${LIBPUBLIC}/tier2${STATIC_LIB_EXT}"
)