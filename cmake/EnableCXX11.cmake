include(CheckCXXCompilerFlag)
if (NOT ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} VERSION_LESS "2.8")
	set(CMAKE_CXX_EXTENSIONS OFF)
	set(CMAKE_CXX_STANDARD 11)
	set(CMAKE_CXX_STANDARD_REQUIRED ON)
else()
	check_cxx_compiler_flag("-std=c++11" COMPILER_SUPPORTS_CXX11)
	if(COMPILER_SUPPORTS_CXX11)
		set(CMAKE_CXX_EXTENSIONS OFF)
		add_definitions("-std=c++11")
	else()
		message( FATAL_ERROR "The compiler doesn't support -std=c++11 option. EDB requires a compiler which supports C++11. If you use gcc, please upgrade. For gcc-incompatible compiler please use cmake 3.1 or higher to get it to work." )
	endif()
endif()

