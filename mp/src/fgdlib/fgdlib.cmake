# fgdlib.cmake

set(FGDLIB_DIR ${CMAKE_CURRENT_LIST_DIR})
set(
	FGDLIB_SOURCE_FILES

	"${FGDLIB_DIR}/gamedata.cpp"
	"${FGDLIB_DIR}/gdclass.cpp"
	"${FGDLIB_DIR}/gdvar.cpp"
	"${FGDLIB_DIR}/inputoutput.cpp"
	"${FGDLIB_DIR}/wckeyvalues.cpp"

	# Header Files
	"${SRCDIR}/public/fgdlib/fgdlib.h"
	"${SRCDIR}/public/fgdlib/gamedata.h"
	"${SRCDIR}/public/fgdlib/gdclass.h"
	"${SRCDIR}/public/fgdlib/gdvar.h"
	"${SRCDIR}/public/fgdlib/helperinfo.h"
	"${SRCDIR}/public/fgdlib/ieditortexture.h"
	"${SRCDIR}/public/fgdlib/inputoutput.h"
	"${SRCDIR}/public/fgdlib/wckeyvalues.h"
)

add_library(fgdlib STATIC ${FGDLIB_SOURCE_FILES})
target_include_directories(
	fgdlib PRIVATE
	"${SRCDIR}/utils/common"
)