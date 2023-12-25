# platform_dirs.cmake

if (UNIX)
	if (APPLE)
		set(PLATSUBDIR "/osx32")
	else()
		set(PLATSUBDIR "/linux32")
	endif()
endif()

if (WIN32)
	set(PLATSUBDIR "/.")
endif()