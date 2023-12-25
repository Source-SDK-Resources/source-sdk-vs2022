# msvc_base.cmake

# If using CMake, we'll require 2015 toolset or greater
if (MSVC_TOOLSET_VERSION LESS 140)
	message(FATAL_ERROR "MSVC must use toolset 140 (2015) or greater")
endif()

if (${CMAKE_SIZEOF_VOID_P} EQUAL 8)
	message(FATAL_ERROR "Source SDK 2013 only supports 32-bit generation")
endif()

# No frame pointer optimization
set(NOFPO 1)

set(MSVC_LINK_OPTION_IGNORE_DEFAULTLIBS_DEBUG
	/NODEFAULTLIB:libc
	/NODEFAULTLIB:libcd
	/NODEFAULTLIB:libcmt
	/NODEFAULTLIB:libcpmt
	/NODEFAULTLIB:libcpmt1
)
set(MSVC_LINK_OPTION_IGNORE_DEFAULTLIBS_RELEASE
	/NODEFAULTLIB:libc
	/NODEFAULTLIB:libcd
	/NODEFAULTLIB:libcmtd
	/NODEFAULTLIB:libcpmtd
	/NODEFAULTLIB:libcpmtd0
	/NODEFAULTLIB:libcpmtd1
)

set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")

add_compile_definitions(
	COMPILER_MSVC
	_CRT_SECURE_NO_DEPRECATE
	_CRT_NONSTDC_NO_DEPRECATE
	_ALLOW_RUNTIME_LIBRARY_MISMATCH
	_ALLOW_ITERATOR_DEBUG_LEVEL_MISMATCH
	_ALLOW_MSC_VER_MISMATCH
)

# Remove default warning level from CMAKE_CXX_FLAGS (This is stupid I know)
string (REGEX REPLACE "/W[0-4]" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")

# Disable C++ exceptions by default
string(REPLACE "/EHsc" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")

string(REPLACE "/Zi" "" CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG}")
string(REPLACE "/Zi" "" CMAKE_C_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG}")

string(REPLACE "/Ob0" "" CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG}")
string(REPLACE "/Ob0" "" CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG}")

string(REPLACE "/Ob2" "" CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE}")
string(REPLACE "/Ob2" "" CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE}")

# These are expanded so that we can pass each option individually to the targets
# So they may choose to exclude them
set(
	MSVC_C_AND_CXX_COMPILE_OPTIONS

	# Set warning level
	/W4

	# Treat warnings as errors... someday
	#/WX

	# Don't Omit Frame Pointers
	"$<${NOFPO}:/Oy->"

	/MP # Multi-processor compilation
	/Gw
	/Zc:threadSafeInit-
	/Zc:__cplusplus
	/Zc:preprocessor
	/Zc:inline

	# We'll be permissive for now
#	/permissive-

	/GR # Enable Run-Time Type Information
	/GF # Enable String Pooling
	/fp:fast # Floating Point Model
	/GS- # Buffer Security Check

	$<$<CONFIG:Release>:/Oi> # Enable Intrinsic Functions
	$<$<CONFIG:Release>:/Ot> # Favor Fast Code
	$<$<CONFIG:Release>:/Gy> # Enable Function-Level Linking

	# Inline Function Expansion
	$<$<CONFIG:Release>:/Ob2>
	$<$<CONFIG:Debug>:/Ob0>
)

add_link_options(
	$<$<CONFIG:Debug>:/DEBUG:FASTLINK>
	$<$<CONFIG:Release>:/DEBUG:FULL>
)

list(
	APPEND ADDITIONAL_COMPILE_OPTIONS_EXE
	$<$<CONFIG:Debug>:/ZI>
	$<$<CONFIG:Release>:/Zi>
	"${MSVC_C_AND_CXX_COMPILE_OPTIONS}"
)

list(
	APPEND ADDITIONAL_COMPILE_OPTIONS_DLL
	$<$<CONFIG:Debug>:/ZI>
	$<$<CONFIG:Release>:/Zi>
	"${MSVC_C_AND_CXX_COMPILE_OPTIONS}"
)

list(
	APPEND ADDITIONAL_COMPILE_OPTIONS_LIB
	$<$<CONFIG:Debug>:/ZI>
	$<$<CONFIG:Release>:/Z7>
	"${MSVC_C_AND_CXX_COMPILE_OPTIONS}"
)

list(
	APPEND ADDITIONAL_LINK_OPTIONS_EXE
	$<$<CONFIG:Debug>:${MSVC_LINK_OPTION_IGNORE_DEFAULTLIBS_DEBUG}>
	$<$<CONFIG:Release>:${MSVC_LINK_OPTION_IGNORE_DEFAULTLIBS_RELEASE}>
	$<$<CONFIG:Release>:/OPT:REF>
	$<$<CONFIG:Release>:/OPT:ICF>
	/MANIFEST:NO
)

list(
	APPEND ADDITIONAL_LINK_OPTIONS_DLL
	$<$<CONFIG:Debug>:${MSVC_LINK_OPTION_IGNORE_DEFAULTLIBS_DEBUG}>
	$<$<CONFIG:Release>:${MSVC_LINK_OPTION_IGNORE_DEFAULTLIBS_RELEASE}>
	$<$<CONFIG:Release>:/OPT:REF>
	$<$<CONFIG:Release>:/OPT:ICF>
	/SAFESEH:NO
	/MANIFEST:NO
)

list(
	APPEND ADDITIONAL_COMPILE_DEFINITIONS_EXE
	$<$<CONFIG:Debug>:_HAS_ITERATOR_DEBUGGING=0>
)

list(
	APPEND ADDITIONAL_COMPILE_DEFINITIONS_DLL
	_USRDLL
	$<$<CONFIG:Debug>:_HAS_ITERATOR_DEBUGGING=0>
)

list(
	APPEND ADDITIONAL_COMPILE_DEFINITIONS_LIB
	_LIB
	$<$<CONFIG:Debug>:_HAS_ITERATOR_DEBUGGING=0>
)

list(
	APPEND ADDITIONAL_LINK_LIBRARIES_DLL
	legacy_stdio_definitions
)