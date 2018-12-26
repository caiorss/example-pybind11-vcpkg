cmake_minimum_required(VERSION 3.9)
set(CMAKE_VERBOSE_MAKEFILE ON)
project(Windows_API_Experiments)

#================================#
#  Global Configuration          #
#================================#

# Set C++ 14 Standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

message("Environment variable: VCPKG_ROOT = $ENV{VCPKG_ROOT}")

if(DEFINED ENV{VCPKG_ROOT} AND NOT DEFINED CMAKE_TOOLCHAIN_FILE)
  set(CMAKE_TOOLCHAIN_FILE "$ENV{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake"
      CACHE STRING "")
endif()

find_package(pybind11 CONFIG REQUIRED)

# Python module: cashflow 
pybind11_add_module(cashflow cashflow.cpp)

# Copy targets to ./ - Directory where is this file CMakeLists.txt (project top level dir)
install(
  TARGETS 
  cashflow 
DESTINATION ${CMAKE_CURRENT_LIST_DIR})

# Create helper target 'run' for running python script (sample client code.)
add_custom_target(run
    COMMAND python3 client1.py 
    DEPENDS install 
    WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}
)
