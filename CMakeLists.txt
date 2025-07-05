# Root CMakeLists.txt
cmake_minimum_required(VERSION 3.20)
project(MinsFrameBack LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(minsframe main.cpp)

# 예) fmt, spdlog, nlohmann_json 사용
find_package(fmt CONFIG REQUIRED)
find_package(spdlog CONFIG REQUIRED)
find_package(nlohmann_json CONFIG REQUIRED)

target_link_libraries(minsframe PRIVATE fmt::fmt spdlog::spdlog nlohmann_json::nlohmann_json)
