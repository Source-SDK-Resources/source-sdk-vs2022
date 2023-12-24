# raytrace.cmake

set(RAYTRACE_DIR ${CMAKE_CURRENT_LIST_DIR})
set(
	RAYTRACE_SOURCE_FILES

	"${RAYTRACE_DIR}/raytrace.cpp"
	"${RAYTRACE_DIR}/trace2.cpp"
	"${RAYTRACE_DIR}/trace3.cpp"
)

add_library(raytrace STATIC ${RAYTRACE_SOURCE_FILES})
target_include_directories(
	raytrace PRIVATE
	"${SRCDIR}/utils/common"
)