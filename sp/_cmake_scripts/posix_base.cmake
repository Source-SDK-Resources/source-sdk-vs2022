# posix_base.cmake

string(REPLACE "-O3" "-O2" CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE}")
string(REPLACE "-O3" "-O2" CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE}")

find_package(Threads REQUIRED)

if (${IS_XCODE})
	if (${CMAKE_SIZEOF_VOID_P} EQUAL 8)
		message(
			FATAL_ERROR
			"  Source SDK 2013 only supports 32-bit generation\n"
			"  Please add -DCMAKE_OSX_ARCHITECTURES=i386 for Xcode generation\n"
			"  NOTE: Only Xcode 9.4.1 and earlier support i386"
		)
	endif()
endif()

add_compile_options(
	-g
	-m32
	$<$<COMPILE_LANGUAGE:CXX>:-fpermissive>
	-fdiagnostics-color
	-Wno-narrowing
	$<${IS_LINUX}:-U_FORTIFY_SOURCE>
	-Usprintf
	-Ustrncpy
	-UPROTECTED_THINGS_ENABLE
	$<${IS_LINUX}:-fabi-compat-version=2>
)

add_link_options(-m32)

add_compile_definitions(
	_POSIX
	POSIX
	GNUC
	COMPILER_GCC
	NO_HOOK_MALLOC
	NO_MALLOC_OVERRIDE
	$<${IS_LINUX}:_LINUX>
	$<${IS_LINUX}:LINUX>
	$<${IS_OSX}:_OSX>
	$<${IS_OSX}:OSX>
	$<${IS_OSX}:_DARWIN_UNLIMITED_SELECT>
	$<${IS_OSX}:FD_SETSIZE=10240>
	$<${IS_OSX}:OVERRIDE_V_DEFINES>
)

if (${IS_LINUX})
	if (NOT ${DEDICATED})
		list(
			APPEND ADDITIONAL_LINK_OPTIONS_EXE
			-Wl,--no-as-needed -ltcmalloc_minimal -Wl,--as-needed
		)
	endif()

	# Helps us catch any linker errors from out of order linking or in general
	list(
		APPEND ADDITIONAL_LINK_OPTIONS_DLL
		-Wl,--no-undefined
	)
endif()

link_libraries(
	Threads::Threads
	${CMAKE_DL_LIBS}
	$<${IS_LINUX}:m>
)

if (${IS_LINUX})
	add_link_options(
		-static-libgcc
		-static-libstdc++
	)
endif()

add_compile_options(
	$<${IS_LINUX}:-march=pentium4>
	-msse2 -mfpmath=sse -mtune=core2
)

list(
	APPEND ADDITIONAL_LINK_LIBRARIES_DLL
	tier0
	tier1
	vstdlib
)

if (${IS_OSX})
	set(CMAKE_SHARED_MODULE_SUFFIX ".dylib")
endif()