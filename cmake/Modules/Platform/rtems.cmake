message("rtems.cmake")

set(ARCH ${HOST})
set(BSP ${RTEMS_BSP})

set(CMAKE_C_COMPILER_FORCED true)
set(CMAKE_CXX_COMPILER_FORCED true)
set(CMAKE_C_COMPILER ${RTEMS_TOOLS_PATH}/bin/${ARCH}-gcc)
set(CMAKE_CXX_COMPILER ${RTEMS_TOOLS_PATH}/bin/${ARCH}-g++)

set(SOEM_INCLUDE_INSTALL_DIR ${INCLUDE_DIR}/soem)
set(SOEM_LIB_INSTALL_DIR ${LIB_DIR})

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${HOST_C_FLAGS}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${HOST_CXX_FLAGS}")

include_directories(
  ${RTEMS_TOOLS_PATH}/i386-rtems6/pc686/lib/include/
  ${RTEMS_TOOLS_PATH}/riscv-rtems6/rv32imafc/lib/include/
  ${RTEMS_TOOLS_PATH}/lm32-rtems6/rv32imafc/lib/include/
)

if(NOT ${HOST_LIBS} STREQUAL "")
  set(OS_LIBS "rtemscpu bsd ${HOST_LIBS}")
else()
  set(OS_LIBS "-lrtemscpu -lbsd")
endif()

