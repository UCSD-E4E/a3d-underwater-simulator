add_executable(app app.cpp)
target_compile_definitions(app PRIVATE cxx_std_17)

target_link_libraries(app PRIVATE underwater_simulator)
