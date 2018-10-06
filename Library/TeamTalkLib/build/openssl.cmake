if (MSVC)
    set ( OPENSSL_INCLUDE_DIR ${TTLIBS_ROOT}/openssl/include )
    set ( OPENSSL_STATIC_LIB ${TTLIBS_ROOT}/openssl/libssl.lib ${TTLIBS_ROOT}/openssl/libcrypto.lib crypt32.lib)
else()
  set (OPENSSL_STATIC_LIB ${TTLIBS_ROOT}/openssl/lib/libssl.a ${TTLIBS_ROOT}/openssl/lib/libcrypto.a)

  # On Linux we link using ssl-dev package
  if ( ${CMAKE_SYSTEM_NAME} MATCHES "Linux" )
    find_library(OPENSSL_SSL_LIBRARY ssl)
    set (OPENSSL_LINK_FLAGS ${OPENSSL_SSL_LIBRARY})
    find_library(OPENSSL_CRYPTO_LIBRARY crypto)
    list (APPEND OPENSSL_LINK_FLAGS ${OPENSSL_CRYPTO_LIBRARY})
  else()
    set (OPENSSL_INCLUDE_DIR ${TTLIBS_ROOT}/openssl/include)
  endif()
endif()
