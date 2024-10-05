# Works with 3.15 and tested through 3.30
cmake_minimum_required(VERSION 3.15...3.30)

# Project name and a few useful settings. Other commands can pick up the results
project(
  Aqua3dUnderwaterOptics
  VERSION 0.1
  DESCRIPTION "A underwater render using NVIDIA Optix for raytracing."
  LANGUAGES CXX)

# Only do these if this is the main project, and not if it is included through add_subdirectory
if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)

  # Optionally set things like CMAKE_CXX_STANDARD, CMAKE_POSITION_INDEPENDENT_CODE here

  # Let's ensure -std=c++xx instead of -std=g++xx
  set(CMAKE_CXX_EXTENSIONS OFF)

  set(CMAKE_CXX_STANDARD 11)
  set(CMAKE_CXX_STANDARD_REQUIRED TRUE)

  # Let's nicely support folders in IDEs
  set_property(GLOBAL PROPERTY USE_FOLDERS ON)

endif()

# The compiled library code is here
add_subdirectory(src)

# The executable code is here
add_subdirectory(apps)

