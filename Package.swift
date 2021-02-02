// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GPGXDeltaCore",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "GPGXDeltaCore",
            targets: ["GPGXDeltaCore"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/rileytestut/DeltaCore.git", .branch("main"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "GPGXDeltaCore",
            dependencies: ["DeltaCore", "GenesisPlusGX"]
        ),
        .target(
            name: "GenesisPlusGX",
            exclude: [
                "Genesis-Plus-GX/builds",
                "Genesis-Plus-GX/gcw0",
                "Genesis-Plus-GX/gx",
                "Genesis-Plus-GX/libretro",
                "Genesis-Plus-GX/sdl",
                
                "Genesis-Plus-GX/core/tremor",
                "Genesis-Plus-GX/libretro/tremor",
                
                "Genesis-Plus-GX/psp2/Makefile",
                "Genesis-Plus-GX/psp2/error.c",
                "Genesis-Plus-GX/psp2/emumain.c",
                "Genesis-Plus-GX/psp2/menu.c",
                "Genesis-Plus-GX/psp2/db.json",
                "Genesis-Plus-GX/psp2/main.c",
                
                "Genesis-Plus-GX/appveyor.yml",
                "Genesis-Plus-GX/HISTORY.txt",
                "Genesis-Plus-GX/LICENSE.txt",
                "Genesis-Plus-GX/Makefile.gc",
                "Genesis-Plus-GX/Makefile.libretro",
                "Genesis-Plus-GX/Makefile.wii",
                "Genesis-Plus-GX/README.md",
            ],
            sources: [
                "dummy.c",
                "Genesis-Plus-GX/core",
                "Genesis-Plus-GX/psp2/config.c",
                "Genesis-Plus-GX/psp2/fileio.c",
                "Genesis-Plus-GX/psp2/unzip.c",
            ],
            cSettings: [
                .headerSearchPath("Genesis-Plus-GX/core/m68k"),
                .headerSearchPath("Genesis-Plus-GX/core/z80"),
                .headerSearchPath("Genesis-Plus-GX/core/sound"),
                .headerSearchPath("Genesis-Plus-GX/core/cart_hw"),
                .headerSearchPath("Genesis-Plus-GX/core/cart_hw/svp"),
                .headerSearchPath("Genesis-Plus-GX/core/cd_hw"),
                .headerSearchPath("Genesis-Plus-GX/core/cd_hw/libchdr/deps/lzma"),
                .headerSearchPath("Genesis-Plus-GX/core/cd_hw/libchdr/deps/libFLAC/include"),
                .headerSearchPath("Genesis-Plus-GX/core/input_hw"),
                .headerSearchPath("Genesis-Plus-GX/core/ntsc"),
                .headerSearchPath("Genesis-Plus-GX/psp2"),
                
                .define("USE_32BPP_RENDERING"),
                .define("FLAC__HAS_OGG", to: "0"),
                .define("HAVE_SYS_PARAM_H"),
                .define("HAVE_LROUND"),
                .define("PACKAGE_VERSION", to: "\"1.3.2\""),
                .define("_7ZIP_ST"),
                .define("LSB_FIRST")
            ]
        )
    ]
)