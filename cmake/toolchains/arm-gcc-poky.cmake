set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR ARM64)
set(SDK_POKY_ROOT $ENV{SDK_POKY_ROOT})

if(NOT SDK_POKY_ROOT)
  message(FATAL_ERROR
    "Please set SDK_POKY_ROOT in the environment when crosscompiling.")
endif()

set(SDK_TARGET_TRIPLE aarch64-poky-linux)
set(SDK_TOOLCHAIN_DIR ${SDK_POKY_ROOT}/x86_64-pokysdk-linux)
set(SDK_SYSROOT_DIR ${SDK_POKY_ROOT}/aarch64-poky-linux)
# Adding this as the GCC toolchain makes compute++ not find headers
set(SDK_DONT_USE_TOOLCHAIN ON)

set(CMAKE_C_COMPILER "${SDK_TOOLCHAIN_DIR}/usr/bin/${SDK_TARGET_TRIPLE}/${SDK_TARGET_TRIPLE}-gcc" CACHE PATH "gcc")
set(CMAKE_CXX_COMPILER "${SDK_TOOLCHAIN_DIR}/usr/bin/${SDK_TARGET_TRIPLE}/${SDK_TARGET_TRIPLE}-g++" CACHE PATH "g++")
set(CMAKE_AR "${SDK_TOOLCHAIN_DIR}/usr/bin/${SDK_TARGET_TRIPLE}/${SDK_TARGET_TRIPLE}-ar" CACHE PATH "archive")
set(CMAKE_LINKER "${SDK_TOOLCHAIN_DIR}/usr/bin/${SDK_TARGET_TRIPLE}/${SDK_TARGET_TRIPLE}-ld" CACHE PATH "linker")
set(CMAKE_NM "${SDK_TOOLCHAIN_DIR}/usr/bin/${SDK_TARGET_TRIPLE}/${SDK_TARGET_TRIPLE}-nm" CACHE PATH "nm")
set(CMAKE_OBJCOPY "${SDK_TOOLCHAIN_DIR}/usr/bin/${SDK_TARGET_TRIPLE}/${SDK_TARGET_TRIPLE}-objcopy" CACHE PATH "objcopy")
set(CMAKE_OBJDUMP "${SDK_TOOLCHAIN_DIR}/usr/bin/${SDK_TARGET_TRIPLE}/${SDK_TARGET_TRIPLE}-objdump" CACHE PATH "objdump")
set(CMAKE_STRIP "${SDK_TOOLCHAIN_DIR}/usr/bin/${SDK_TARGET_TRIPLE}/${SDK_TARGET_TRIPLE}-strip" CACHE PATH "strip")
set(CMAKE_RANLIB "${SDK_TOOLCHAIN_DIR}/usr/bin/${SDK_TARGET_TRIPLE}/${SDK_TARGET_TRIPLE}-ranlib" CACHE PATH "ranlib")

set(CMAKE_FIND_ROOT_PATH ${SDK_SYSROOT_DIR})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

set(CMAKE_SYSROOT "${SDK_SYSROOT_DIR}")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__aarch64__ --sysroot=${SDK_SYSROOT_DIR}" CACHE INTERNAL "")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -D__aarch64__ --sysroot=${SDK_SYSROOT_DIR}" CACHE INTERNAL "")

set(CMAKE_CXX_LINK_EXECUTABLE "<CMAKE_CXX_COMPILER> <CMAKE_CXX_LINK_FLAGS> <LINK_FLAGS> -o <TARGET> <OBJECTS> <LINK_LIBRARIES>" CACHE INTERNAL "")
