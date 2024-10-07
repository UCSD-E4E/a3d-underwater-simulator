# Note that headers are optional, and do not affect add_library, but they will not
# show up in IDEs unless they are listed in add_library.

# Optionally glob, but only for CMake 3.12 or later:
file(GLOB HEADER_LIST CONFIGURE_DEPENDS "${Aqua3dUnderwaterOptics_SOURCE_DIR}/include/modern/**/*.hpp")
file(GLOB SOURCE_LIST CONFIGURE_DEPENDS **/*.cpp **/*.cu)

# Make an automatic library - will be static or dynamic based on user setting
add_library(underwater_simulator ${SOURCE_LIST} ${HEADER_LIST})

# We need this directory, and users of our library will need it too
target_include_directories(underwater_simulator PUBLIC ../include)

# Find at least a 12.0 version of CUDA.
find_package(CUDAToolkit 12.0 REQUIRED)

# Search for the OptiX libraries and include files.
set(OPTIX_DIR $ENV{OptiX_INSTALL_DIR}/include)
message("OptixDir: ${OPTIX_DIR}")

target_include_directories(
	underwater_simulator PUBLIC
	${OPTIX_DIR}
)

# All users of this library will need at least C++17
target_compile_features(underwater_simulator PUBLIC cxx_std_17)

# IDEs should put the headers in a nice place
source_group(
  TREE "${PROJECT_SOURCE_DIR}/include"
  PREFIX "Header Files"
  FILES ${HEADER_LIST})
