# postbuild.cmake

include_guard(GLOBAL)

function(target_strip_symbols target)
	if (${IS_LINUX})
		add_custom_command(
			TARGET ${target} POST_BUILD
			COMMAND ${CMAKE_OBJCOPY} "$<TARGET_FILE:${target}>" "$<TARGET_FILE:${target}>.dbg"
			COMMAND ${CMAKE_OBJCOPY} --add-gnu-debuglink="$<TARGET_FILE:${target}>.dbg" "$<TARGET_FILE:${target}>"
			COMMAND ${CMAKE_STRIP} -x "$<TARGET_FILE:${target}>" $<$<CONFIG:Release>:-S>
		)
	endif()

	# Xcode will do  this for us through CMAKE_XCODE_ATTRIBUTE_DEBUG_INFORMATION_FORMAT
	if (${IS_OSX} AND NOT ${IS_XCODE})
		add_custom_command(
			TARGET ${target} POST_BUILD
			COMMAND dsymutil "$<TARGET_FILE:${target}>"
			COMMAND ${CMAKE_STRIP} -x "$<TARGET_FILE:${target}>"
		)
	endif()
endfunction()