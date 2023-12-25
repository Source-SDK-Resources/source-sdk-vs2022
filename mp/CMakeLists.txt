cmake_minimum_required(VERSION 3.18 FATAL_ERROR)

set(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "" FORCE)

if (APPLE)
	# NOTE: You will need to pass this as a command line parameter for the Xcode generator -DCMAKE_OSX_ARCHITECTURES=i386
	# Also note only Xcode 9.4.1 and earlier support i386
	set(CMAKE_OSX_ARCHITECTURES i386)
	set(CMAKE_OSX_DEPLOYMENT_TARGET 10.9)
	set(CMAKE_XCODE_ATTRIBUTE_DEBUG_INFORMATION_FORMAT "dwarf-with-dsym")
endif()

project(SourceSDK2013)

# For some reason, checking if CMAKE_BUILD_TYPE is defined is unreliable
# So simply check if it's empty instead
if ("${CMAKE_BUILD_TYPE}" STREQUAL "")
	set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Build type" FORCE)
endif()

# Modern VS versions default to C++14 anyway, so make it consistent
# But in the future we may want so support C++20
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_VISIBILITY_PRESET hidden)
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# This is a way to emulate groups.vgc
set(BUILD_GROUP "game" CACHE STRING "Build Group")

# For the CMake GUIs that support a combobox list
set_property(CACHE BUILD_GROUP PROPERTY STRINGS
	"everything"
	"game"
	"shaders"
)

# Which game are we building?
set(BUILD_GAME "hl2mp" CACHE STRING "Build Game")

set_property(
	CACHE BUILD_GAME PROPERTY STRINGS
	"hl2mp" # Only hl2mp at the moment
)

set(SRCDIR "${CMAKE_CURRENT_LIST_DIR}/src")
set(GAMEDIR "${CMAKE_CURRENT_LIST_DIR}/game")
set(THIRDPARTYDIR "${SRCDIR}/thirdparty")

# Compile options that are populated and set for each target depending on their type
set(ADDITIONAL_COMPILE_OPTIONS_EXE)
set(ADDITIONAL_COMPILE_OPTIONS_DLL)
set(ADDITIONAL_COMPILE_OPTIONS_LIB)

# Libraries that are linked to for each target depending on their type
set(ADDITIONAL_LINK_LIBRARIES_EXE)
set(ADDITIONAL_LINK_LIBRARIES_DLL)

# Linker options that are populated and set for each target depending on their type
set(ADDITIONAL_LINK_OPTIONS_EXE)
set(ADDITIONAL_LINK_OPTIONS_DLL)
set(ADDITIONAL_LINK_OPTIONS_LIB)

# Sources that are added to each target depending on their type
set(ADDITIONAL_SOURCES_EXE)
set(ADDITIONAL_SOURCES_DLL)
set(ADDITIONAL_SOURCES_LIB)

# Compile definitions that are added to each target depending on their type
set(ADDITIONAL_COMPILE_DEFINITIONS_EXE)
set(ADDITIONAL_COMPILE_DEFINITIONS_DLL)
set(ADDITIONAL_COMPILE_DEFINITIONS_LIB)

include("_cmake_scripts/pch_skip.cmake")
include("_cmake_scripts/platform_dirs.cmake")
include("_cmake_scripts/base.cmake")
include("_cmake_scripts/video_base.cmake")
include("_cmake_scripts/postbuild.cmake")

set(LIBPUBLIC "${SRCDIR}/lib/public${PLATSUBDIR}")
set(LIBCOMMON "${SRCDIR}/lib/common${PLATSUBDIR}")

link_directories(
	${LIBPUBLIC}
	${LIBCOMMON}
)

include_directories(
	"${SRCDIR}/common"
	"${SRCDIR}/public"
	"${SRCDIR}/public/tier0"
	"${SRCDIR}/public/tier1"
)

add_compile_definitions($<$<CONFIG:Debug>:DEBUG> $<$<CONFIG:Debug>:_DEBUG>)
add_compile_definitions($<$<CONFIG:Release>:NDEBUG>)

if (${IS_WINDOWS})
	include("_cmake_scripts/windows_base.cmake")
elseif (${IS_LINUX} OR ${IS_OSX})
	include("_cmake_scripts/posix_base.cmake")
endif()

include("_cmake_scripts/groups.cmake")

# Store all targets in a variable name ( See: https://stackoverflow.com/questions/37434946/how-do-i-iterate-over-all-cmake-targets-programmatically/62311397#62311397 )
function(get_all_targets var)
    set(targets)
    get_all_targets_recursive(targets ${CMAKE_CURRENT_SOURCE_DIR})
    set(${var} ${targets} PARENT_SCOPE)
endfunction()

macro(get_all_targets_recursive targets dir)
    get_property(subdirectories DIRECTORY ${dir} PROPERTY SUBDIRECTORIES)
    foreach(subdir ${subdirectories})
        get_all_targets_recursive(${targets} ${subdir})
    endforeach()

    get_property(current_targets DIRECTORY ${dir} PROPERTY BUILDSYSTEM_TARGETS)
    list(APPEND ${targets} ${current_targets})
endmacro()

get_all_targets(ALL_TARGETS)

# Set of helper functions to add defintions/options/libs for each target in a filtered way
function(add_compile_definitions_filtered target definitions)
	foreach(additional_definition IN LISTS ${definitions})
		set(SHOULD_EXCLUDE 0)
		# Exclude the compile definition if target defines an exclude list
		foreach(exclude IN LISTS "${target}_exclude_compile_definitions")
			if (${additional_definition} STREQUAL ${exclude})
				set(SHOULD_EXCLUDE 1)
				break()
			endif()
		endforeach()
		if (NOT ${SHOULD_EXCLUDE})
			target_compile_definitions(${target} PRIVATE ${additional_definition})
		endif()
	endforeach()
endfunction()


function(add_compile_options_filtered target options)
	foreach(additional_option IN LISTS ${options})
		set(SHOULD_EXCLUDE 0)
		# Exclude the compile options if target defines an exclude list
		foreach(exclude IN LISTS "${target}_exclude_compile_options")
			if (${additional_option} STREQUAL ${exclude})
				set(SHOULD_EXCLUDE 1)
				break()
			endif()
		endforeach()
		if (NOT ${SHOULD_EXCLUDE})
			target_compile_options(${target} PRIVATE "$<$<COMPILE_LANGUAGE:C,CXX>:${additional_option}>")
		endif()
	endforeach()
endfunction()

function(add_sources_filtered target sources)
	foreach(additional_source IN LISTS ${sources})
		set(SHOULD_EXCLUDE 0)
		# Exclude the source if target defines an exclude list
		foreach(exclude IN LISTS "${target}_exclude_source")
			if (${additional_source} STREQUAL ${exclude})
				set(SHOULD_EXCLUDE 1)
				break()
			endif()
		endforeach()
		if (NOT ${SHOULD_EXCLUDE})
			target_sources(${target} PRIVATE ${additional_source})
		endif()
	endforeach()
endfunction()

function(add_libraries_filtered target libraries)
	foreach(additional_lib IN LISTS ${libraries})
		set(SHOULD_EXCLUDE 0)
		# Exclude the lib if target defines an exclude list
		foreach(exclude IN LISTS "${target}_exclude_lib")
			if (${additional_lib} STREQUAL ${exclude})
				set(SHOULD_EXCLUDE 1)
				break()
			endif()
		endforeach()
		if (NOT ${SHOULD_EXCLUDE})
			get_target_property(libraries ${target} LINK_LIBRARIES)
			# Don't bother adding it if the target already links it manually
			foreach(lib IN LISTS libraries)
				if (${additional_lib} STREQUAL ${lib})
					set(SHOULD_EXCLUDE 1)
					break()
				endif()
			endforeach()
		endif()
		if (NOT ${SHOULD_EXCLUDE})
			target_link_libraries(${target} PRIVATE ${additional_lib})
		endif()
	endforeach()
endfunction()

# Iterates over all the targets and add necessary definitions/options/libs
# This is an incredible hack, but it allows for targets to specify exclude lists
# This allows us to emulate -$File and such from VPC
foreach(target ${ALL_TARGETS})
	# Define an empty exclude list if one isn't defined
	if (NOT DEFINED "${target}_exclude_compile_options")
		set("${target}_exclude_compile_options")
	endif()

	# Define an empty exclude list if one isn't defined
	if (NOT DEFINED "${target}_exclude_lib")
		set("${target}_exclude_lib")
	endif()

	# Define an empty exclude list if one isn't defined
	if (NOT DEFINED "${target}_exclude_source")
		set("${target}_exclude_source")
	endif()

	get_target_property(target_type ${target} TYPE)
	if (${target_type} STREQUAL "EXECUTABLE")
		add_compile_options_filtered(${target} ADDITIONAL_COMPILE_OPTIONS_EXE)
		add_libraries_filtered(${target} ADDITIONAL_LINK_LIBRARIES_EXE)
		add_sources_filtered(${target} ADDITIONAL_SOURCES_EXE)
		target_link_options(${target} PRIVATE ${ADDITIONAL_LINK_OPTIONS_EXE})
		target_compile_definitions(${target} PRIVATE MEMOVERRIDE_MODULE=$<TARGET_NAME_IF_EXISTS:${target}>)
		add_compile_definitions_filtered(${target} ADDITIONAL_COMPILE_DEFINITIONS_EXE)

		# Only applies to Linux and OSX
		target_strip_symbols(${target})
	elseif((${target_type} STREQUAL "SHARED_LIBRARY") OR (${target_type} STREQUAL "MODULE_LIBRARY"))
		add_compile_options_filtered(${target} ADDITIONAL_COMPILE_OPTIONS_DLL)
		add_libraries_filtered(${target} ADDITIONAL_LINK_LIBRARIES_DLL)
		add_sources_filtered(${target} ADDITIONAL_SOURCES_DLL)
		target_link_options(${target} PRIVATE ${ADDITIONAL_LINK_OPTIONS_DLL})
		target_compile_definitions(${target} PRIVATE MEMOVERRIDE_MODULE=$<TARGET_NAME_IF_EXISTS:${target}> DLLNAME=$<TARGET_NAME_IF_EXISTS:${target}>)
		add_compile_definitions_filtered(${target} ADDITIONAL_COMPILE_DEFINITIONS_DLL)

		# Only applies to Linux and OSX
		target_strip_symbols(${target})
	elseif(${target_type} STREQUAL "STATIC_LIBRARY")
		add_compile_options_filtered(${target} ADDITIONAL_COMPILE_OPTIONS_LIB)
		add_sources_filtered(${target} ADDITIONAL_SOURCES_LIB)
		target_link_options(${target} PRIVATE ${ADDITIONAL_LINK_OPTIONS_LIB})
		target_compile_definitions(${target} PRIVATE LIBNAME=$<TARGET_NAME_IF_EXISTS:${target}>)
		add_compile_definitions_filtered(${target} ADDITIONAL_COMPILE_DEFINITIONS_LIB)
	endif()

endforeach()