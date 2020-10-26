target_triple = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "glm"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"

    targetdir ("bin/"..target_triple.."/%{prj.name}")
    objdir ("bin/obj/"..target_triple.."/%{prj.name}")

    files {
        "glm/**.hpp",
        "glm/**.inl",
        "glm/**.cpp",
    }

    includedirs {
        ".",
    }

    filter "configurations:debug"
        defines "DEBUG"
        symbols "On"

    filter "configurations:release"
        defines "NDEBUG"
        optimize "On"
