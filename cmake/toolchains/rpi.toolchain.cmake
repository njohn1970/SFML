#Cmake tool chain for raspberryPI 

cmake_minimum_required( VERSION 2.6.3 )

#message("CMAKE_CROSSCOMPILING: " ${CMAKE_CROSSCOMPILING})
if( DEFINED CMAKE_CROSSCOMPILING )
 # subsequent toolchain loading is not really needed
 #message("Stopping here")
 return()
endif()

if( CMAKE_TOOLCHAIN_FILE )
 # touch toolchain variable to suppress "unused variable" warning
endif()

set( CMAKE_SYSTEM_NAME Linux )

set( CMAKE_SYSTEM_VERSION 1 )

# specify the cross compiler
SET(CMAKE_C_COMPILER   /home/njohn/code/rpi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/arm-linux-gnueabihf-gcc)
SET(CMAKE_CXX_COMPILER /home/njohn/code/rpi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin/arm-linux-gnueabihf-g++)

# where is the target environment 
SET(CMAKE_FIND_ROOT_PATH  $ENV{RPI_FS_ROOT})
message( "CMAKE_FIND_ROOT_PATH:"  ${CMAKE_FIND_ROOT_PATH})

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

#Fixme
#include_directories("/mnt/rp3/usr/include/arm-linux-gnueabihf")
#link_directories("/mnt/rp3/usr/lib/arm-linux-gnueabihf")

set(CMAKE_INCLUDE_PATH ${CMAKE_INCLUDE_PATH} "/usr/include/arm-linux-gnueabihf")

set(RPI_VER 2)
set(BUILD_RPI True)
