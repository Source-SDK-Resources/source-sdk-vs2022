# qc_eyes.cmake

set(QC_EYES_DIR ${CMAKE_CURRENT_LIST_DIR})
set(
	QC_EYES_SOURCE_FILES

	"${QC_EYES_DIR}/QC_Eyes.cpp"
	"${QC_EYES_DIR}/QC_Eyes.rc"
	"${QC_EYES_DIR}/QC_EyesDlg.cpp"
	"${QC_EYES_DIR}/StdAfx.cpp"

	# Header Files
	"${QC_EYES_DIR}/QC_Eyes.h"
	"${QC_EYES_DIR}/QC_EyesDlg.h"
	"${QC_EYES_DIR}/Resource.h"
	"${QC_EYES_DIR}/StdAfx.h"

	# Resources
	"${QC_EYES_DIR}/res/eye_default.bmp"
	"${QC_EYES_DIR}/res/eye_lower_hi.bmp"
	"${QC_EYES_DIR}/res/eye_lower_lo.bmp"
	"${QC_EYES_DIR}/res/eye_lower_mid.bmp"
	"${QC_EYES_DIR}/res/eye_upper_hi.bmp"
	"${QC_EYES_DIR}/res/eye_upper_lo.bmp"
	"${QC_EYES_DIR}/res/eye_upper_mid.bmp"
	"${QC_EYES_DIR}/res/eye_XY_L.bmp"
	"${QC_EYES_DIR}/res/eye_XY_R.bmp"
	"${QC_EYES_DIR}/res/eye_Z_L.bmp"
	"${QC_EYES_DIR}/res/eye_Z_R.bmp"
	"${QC_EYES_DIR}/res/QC_Eyes.ico"
	"${QC_EYES_DIR}/res/QC_Eyes.rc2"
)

set(
	qc_eyes_exclude_source
	"${SRCDIR}/public/tier0/memoverride.cpp"
)

add_executable(qc_eyes WIN32 ${QC_EYES_SOURCE_FILES})

set_target_properties(
	qc_eyes PROPERTIES
	RUNTIME_OUTPUT_DIRECTORY "${GAMEDIR}/bin"
)

target_precompile_headers(
	qc_eyes PRIVATE
	"${QC_EYES_DIR}/StdAfx.h"
)

target_compile_definitions(
	qc_eyes PRIVATE
	NO_WARN_MBCS_MFC_DEPRECATION
)