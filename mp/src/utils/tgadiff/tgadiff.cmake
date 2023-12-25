# tgadiff.cmake

set(TGADIFF_DIR ${CMAKE_CURRENT_LIST_DIR})
set(
	TGADIFF_SOURCE_FILES

	"${TGADIFF_DIR}/tgadiff.cpp"
)

add_executable(tgadiff ${TGADIFF_SOURCE_FILES})

set_target_properties(
	tgadiff PROPERTIES
	RUNTIME_OUTPUT_DIRECTORY "${GAMEDIR}/bin"
	RUNTIME_OUTPUT_DIRECTORY_DEBUG "${GAMEDIR}/bin"
	RUNTIME_OUTPUT_DIRECTORY_RELEASE "${GAMEDIR}/bin"
)

target_link_libraries(
	tgadiff PRIVATE
	"${LIBPUBLIC}/bitmap${STATIC_LIB_EXT}"
	mathlib
	"${LIBPUBLIC}/tier2${STATIC_LIB_EXT}"
)