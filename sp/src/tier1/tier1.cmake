# tier1.cmake

set(TIER1_DIR ${CMAKE_CURRENT_LIST_DIR})

set(
	TIER1_SOURCE_FILES
	"${TIER1_DIR}/bitbuf.cpp"
	"${TIER1_DIR}/newbitbuf.cpp"
	"${TIER1_DIR}/byteswap.cpp"
	"${TIER1_DIR}/characterset.cpp"
	"${TIER1_DIR}/checksum_crc.cpp"
	"${TIER1_DIR}/checksum_md5.cpp"
	"${TIER1_DIR}/checksum_sha1.cpp"
	"${TIER1_DIR}/commandbuffer.cpp"
	"${TIER1_DIR}/convar.cpp"
	"${TIER1_DIR}/datamanager.cpp"
	"${TIER1_DIR}/diff.cpp"
	"${TIER1_DIR}/generichash.cpp"
	"${TIER1_DIR}/ilocalize.cpp"
	"${TIER1_DIR}/interface.cpp"
	"${TIER1_DIR}/KeyValues.cpp"
	"${TIER1_DIR}/kvpacker.cpp"
	"${TIER1_DIR}/lzmaDecoder.cpp"
	"$<$<NOT:${IS_SOURCESDK}>:${TIER1_DIR}/lzss.cpp>"
	"${TIER1_DIR}/mempool.cpp"
	"${TIER1_DIR}/memstack.cpp"
	"${TIER1_DIR}/NetAdr.cpp"
	"${TIER1_DIR}/splitstring.cpp"

	"$<${IS_WINDOWS}:${TIER1_DIR}/processor_detect.cpp>"
	"$<${IS_POSIX}:${TIER1_DIR}/processor_detect_linux.cpp>"

	"$<${IS_LINUX}:${TIER1_DIR}/qsort_s.cpp>"

	"${TIER1_DIR}/rangecheckedvar.cpp"
	"${TIER1_DIR}/reliabletimer.cpp"
	"${TIER1_DIR}/stringpool.cpp"
	"${TIER1_DIR}/strtools.cpp"
	"${TIER1_DIR}/tier1.cpp"
	"${TIER1_DIR}/tokenreader.cpp"
	"${TIER1_DIR}/sparsematrix.cpp"
	"${TIER1_DIR}/uniqueid.cpp"
	"${TIER1_DIR}/utlbuffer.cpp"
	"${TIER1_DIR}/utlbufferutil.cpp"
	"${TIER1_DIR}/utlstring.cpp"
	"${TIER1_DIR}/utlsymbol.cpp"
	"$<${IS_LINUX}:${TIER1_DIR}/pathmatch.cpp>"
	"${TIER1_DIR}/snappy.cpp"
	"${TIER1_DIR}/snappy-sinksource.cpp"
	"${TIER1_DIR}/snappy-stubs-internal.cpp"

	# Header Files

	# Internal Header Files
	"${TIER1_DIR}/snappy-internal.h"
	"${TIER1_DIR}/snappy-stubs-internal.h"

	"${SRCDIR}/public/tier1/bitbuf.h"
	"${SRCDIR}/public/tier1/byteswap.h"
	"${SRCDIR}/public/tier1/callqueue.h"
	"${SRCDIR}/public/tier1/characterset.h"
	"${SRCDIR}/public/tier1/checksum_crc.h"
	"${SRCDIR}/public/tier1/checksum_md5.h"
	"${SRCDIR}/public/tier1/checksum_sha1.h"
	"${SRCDIR}/public/tier1/CommandBuffer.h"
	"${SRCDIR}/public/tier1/convar.h"
	"${SRCDIR}/public/tier1/datamanager.h"
	"${SRCDIR}/public/datamap.h"
	"${SRCDIR}/public/tier1/delegates.h"
	"${SRCDIR}/public/tier1/diff.h"
	"${SRCDIR}/public/tier1/fmtstr.h"
	"${SRCDIR}/public/tier1/functors.h"
	"${SRCDIR}/public/tier1/generichash.h"
	"${SRCDIR}/public/tier1/iconvar.h"
	"${SRCDIR}/public/tier1/ilocalize.h"
	"${SRCDIR}/public/tier1/interface.h"
	"${SRCDIR}/public/tier1/KeyValues.h"
	"${SRCDIR}/public/tier1/kvpacker.h"
	"${SRCDIR}/public/tier1/lzmaDecoder.h"
	"${SRCDIR}/public/tier1/lzss.h"
	"${SRCDIR}/public/tier1/mempool.h"
	"${SRCDIR}/public/tier1/memstack.h"
	"${SRCDIR}/public/tier1/netadr.h"
	"${SRCDIR}/public/tier1/processor_detect.h"
	"${SRCDIR}/public/tier1/rangecheckedvar.h"
	"${SRCDIR}/public/tier1/refcount.h"
	"${SRCDIR}/public/tier1/smartptr.h"
	"${SRCDIR}/public/tier1/snappy.h"
	"${SRCDIR}/public/tier1/snappy-sinksource.h"
	"${SRCDIR}/public/tier1/stringpool.h"
	"${SRCDIR}/public/tier1/strtools.h"
	"${SRCDIR}/public/tier1/tier1.h"
	"${SRCDIR}/public/tier1/tokenreader.h"
	"$<${IS_WINDOWS}:${SRCDIR}/public/tier1/uniqueid.h>"
	"${SRCDIR}/public/tier1/utlbidirectionalset.h"
	"${SRCDIR}/public/tier1/utlblockmemory.h"
	"${SRCDIR}/public/tier1/utlbuffer.h"
	"${SRCDIR}/public/tier1/utlbufferutil.h"
	"${SRCDIR}/public/tier1/utlcommon.h"
	"${SRCDIR}/public/tier1/utldict.h"
	"${SRCDIR}/public/tier1/utlenvelope.h"
	"${SRCDIR}/public/tier1/utlfixedmemory.h"
	"${SRCDIR}/public/tier1/utlhandletable.h"
	"${SRCDIR}/public/tier1/utlhash.h"
	"${SRCDIR}/public/tier1/utlhashtable.h"
	"${SRCDIR}/public/tier1/utllinkedlist.h"
	"${SRCDIR}/public/tier1/utlmap.h"
	"${SRCDIR}/public/tier1/utlmemory.h"
	"${SRCDIR}/public/tier1/utlmultilist.h"
	"${SRCDIR}/public/tier1/utlpriorityqueue.h"
	"${SRCDIR}/public/tier1/utlqueue.h"
	"${SRCDIR}/public/tier1/utlrbtree.h"
	"${SRCDIR}/public/tier1/UtlSortVector.h"
	"${SRCDIR}/public/tier1/utlstack.h"
	"${SRCDIR}/public/tier1/utlstring.h"
	"${SRCDIR}/public/tier1/UtlStringMap.h"
	"${SRCDIR}/public/tier1/utlsymbol.h"
	"${SRCDIR}/public/tier1/utlsymbollarge.h"
	"${SRCDIR}/public/tier1/utlvector.h"
	"$<${IS_WINDOWS}:${SRCDIR}/common/xbox/xboxstubs.h>"
)

set_source_files_properties(
	"$<${IS_WINDOWS}:${TIER1_DIR}/processor_detect.cpp>"
	PROPERTIES
	COMPILE_FLAGS
	/EHsc
)

add_library(
	tier1 STATIC
	${TIER1_SOURCE_FILES}
)

target_compile_definitions(
	tier1 PRIVATE
	TIER1_STATIC_LIB
)

target_link_libraries(
	tier1 INTERFACE
	$<${IS_WINDOWS}:Rpcrt4>

	# strtools depends on this, so make it an interface
	# instead of linking it everywhere
	$<${IS_OSX}:iconv>
)
