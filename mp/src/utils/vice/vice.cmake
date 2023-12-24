# vice.cmake

set(VICE_DIR ${CMAKE_CURRENT_LIST_DIR})
set(
	VICE_SOURCE_FILES

	"${SRCDIR}/utils/common/cmdlib.cpp"
	"${SRCDIR}/public/filesystem_helpers.cpp"
	"${SRCDIR}/public/filesystem_init.cpp"
	"${SRCDIR}/utils/common/filesystem_tools.cpp"
	"${VICE_DIR}/vice.cpp"

	# Header Files
	"${SRCDIR}/public/mathlib/IceKey.H"
)

add_executable(vice ${VICE_SOURCE_FILES})

set_target_properties(
	vice PROPERTIES
	RUNTIME_OUTPUT_DIRECTORY "${GAMEDIR}/bin"
)

target_include_directories(
	vice PRIVATE
	"${SRCDIR}/utils/common"
)

target_link_libraries(
	vice PRIVATE
	"${LIBPUBLIC}/tier2${STATIC_LIB_EXT}"
	mathlib
)