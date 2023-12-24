# mathlib.cmake

set(MATHLIB_DIR ${CMAKE_CURRENT_LIST_DIR})
set(
	MATHLIB_SOURCE_FILES

	"${MATHLIB_DIR}/color_conversion.cpp"
	"${MATHLIB_DIR}/halton.cpp"
	"${MATHLIB_DIR}/lightdesc.cpp"
	"${MATHLIB_DIR}/mathlib_base.cpp"
	"${MATHLIB_DIR}/powsse.cpp"
	"${MATHLIB_DIR}/sparse_convolution_noise.cpp"
	"${MATHLIB_DIR}/sseconst.cpp"
	"${MATHLIB_DIR}/sse.cpp"
	"${MATHLIB_DIR}/ssenoise.cpp"				
	"$<$<OR:${IS_WINDOWS},${IS_LINUX}>:${MATHLIB_DIR}/3dnow.cpp>"
	"${MATHLIB_DIR}/anorms.cpp"
	"${MATHLIB_DIR}/bumpvects.cpp"
	"${MATHLIB_DIR}/IceKey.cpp"
	"${MATHLIB_DIR}/imagequant.cpp"
	"${MATHLIB_DIR}/polyhedron.cpp"
	"${MATHLIB_DIR}/quantize.cpp"
	"${MATHLIB_DIR}/randsse.cpp"
	"${MATHLIB_DIR}/spherical.cpp"
	"${MATHLIB_DIR}/simdvectormatrix.cpp"
	"${MATHLIB_DIR}/vector.cpp"
	"${MATHLIB_DIR}/vmatrix.cpp"
	"${MATHLIB_DIR}/almostequal.cpp"

	# Public Header Files
	"$<$<OR:${IS_WINDOWS},${IS_LINUX}>:${SRCDIR}/public/mathlib/amd3dx.h>"
	"${SRCDIR}/public/mathlib/anorms.h"
	"${SRCDIR}/public/mathlib/bumpvects.h"		
	"${SRCDIR}/public/mathlib/compressed_3d_unitvec.h"
	"${SRCDIR}/public/mathlib/compressed_light_cube.h"
	"${SRCDIR}/public/mathlib/compressed_vector.h"
	"${SRCDIR}/public/mathlib/halton.h"
	"${SRCDIR}/public/mathlib/IceKey.H"
	"${SRCDIR}/public/mathlib/lightdesc.h"
	"${SRCDIR}/public/mathlib/math_pfns.h"
	"${SRCDIR}/public/mathlib/mathlib.h"
	"${SRCDIR}/public/mathlib/noise.h"
	"${SRCDIR}/public/mathlib/polyhedron.h"
	"${SRCDIR}/public/mathlib/quantize.h"
	"${SRCDIR}/public/mathlib/simdvectormatrix.h"
	"${SRCDIR}/public/mathlib/spherical_geometry.h"		
	"${SRCDIR}/public/mathlib/ssemath.h"		
	"${SRCDIR}/public/mathlib/ssequaternion.h"		
	"${SRCDIR}/public/mathlib/vector.h"
	"${SRCDIR}/public/mathlib/vector2d.h"
	"${SRCDIR}/public/mathlib/vector4d.h"
	"${SRCDIR}/public/mathlib/vmatrix.h"
	"${SRCDIR}/public/mathlib/vplane.h"

	# Header Files
	"${MATHLIB_DIR}/noisedata.h"
	"${MATHLIB_DIR}/sse.h"
	"$<$<OR:${IS_WINDOWS},${IS_LINUX}>:${MATHLIB_DIR}/3dnow.h>"
)

add_library(mathlib STATIC ${MATHLIB_SOURCE_FILES})

target_include_directories(
	mathlib PRIVATE
	"${SRCDIR}/public/mathlib"
)

target_compile_definitions(
	mathlib PRIVATE
	MATHLIB_LIB
)