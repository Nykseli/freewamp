CFLAGS=\
		-std=c11\
		-fomit-frame-pointer\
		-fPIC -pthread\
		-I/usr/include/alsa\
		-Wdeclaration-after-statement\
		-Wall -Wdisabled-optimization\
		-Wpointer-arith -Wredundant-decls\
		-Wwrite-strings -Wtype-limits -Wundef\
		-Wmissing-prototypes\
		-Wno-pointer-to-int-cast\
		-Wstrict-prototypes\
		-Wempty-body\
		-Wno-parentheses\
		-Wno-switch\
		-Wno-format-zero-length\
		-Wno-pointer-sign\
		-Wno-unused-const-variable\
		-Wno-char-subscripts\
		-O3\
		-fno-math-errno\
		-fno-signed-zeros\
		-fno-tree-vectorize\
		-Werror=format-security\
		-Werror=implicit-function-declaration\
		-Werror=missing-prototypes\
		-Werror=return-type\
		-Werror=vla\
		-Wformat\
		-fdiagnostics-color=auto\
		-Wno-maybe-uninitialized\
		-lSDL2\
		-pthread\
		-lm\
		-lz\
		-IFFmpeg/\
		-I/usr/include/SDL2

COBJECTS := $(shell find . -type f -name "*.o" ! -path "./FFmpeg/fftools/ffplay.o" ! -path "./audioplayer.o")


all: audioplayer.c
	gcc audioplayer.c $(COBJECTS)  $(CFLAGS) -o audioplay

audioplayer.o: audioplayer.c
	gcc -c -fPIC audioplayer.c $(CFLAGS) -o audioplayer.o
