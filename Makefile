FAS ?= fas
SDL_CFLAGS := $(shell sdl-config --cflags)
SDL_LIBS := $(shell sdl-config --libs)

.PHONY: all run
all: build/fasge

build/fasge: main.fas engine/core.fas engine/sdl.fas
	mkdir -p build
	$(FAS) main.fas $(SDL_CFLAGS) $(SDL_LIBS) -o $@

run: build/fasge
	./build/fasge
