Overview
--------------
Support is intended to be for Windows, Linux, Mac, Android, and iPhone



Targets to Support:
-----------------------
# Supported
Unsupported



Platform OS	                Arch            Target Triple	            Notes
--------------------------------------------------------------------------------------------------------------------------
# Windows 64 bit	        x86_64	        x86_64-pc-windows-msvc	    Standard Steam/AAA Windows build
# Windows 32 bit (Legacy)   i686            i686-pc-windows-msvc	    32-bit legacy games
# Windows (MinGW Toolchain) x86_64	        x86_64-w64-windows-gnu	    MinGW/GCC toolchain builds

Xbox Series X S             x86_64          x86_64-microsoft-xbox       XBOX Console

# Linux 64 bit              x86_64          x86_64-pc-linux-gnu         Most common Linux target
                                            x86_64-unknown-linux-gnu
# Linux 32 bit              i686            i686-pc-linux-gnu           32 Bit Linux target
                                            i686-unknown-linux-gnu
# Linux 64 bit (musl C Lib) x86_64	        x86_64-pc-linux-musl	    Indie / static linking use
                                            x86_64-unknown-linux-musl

# Android	                arm64   	    aarch64-linux-android	    Modern Play Store requirement
# Android (legacy)	        armv7	        armv7a-linux-androideabi	32-bit legacy devices

# MacOS (Intel)	            x86_64	        x86_64-apple-darwin	        Older Intel Macs
# MacOS (Apple Silicon)	    arm64	        aarch64-apple-darwin	    Modern Mac (M1+)

# iOS	                    arm64	        arm64-apple-ios	            iPhone / iPad builds

PlayStation 5	           	x86_64	        x86_64-sony-ps5	            SDK-only, not public toolchain

Nintendo Switch	            arm64	        aarch64-nintendo-switch	    SDK-only target