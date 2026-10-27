FAS ?= fas

EXAMPLES := snake minesweeper square
ENGINE := $(wildcard engine/*.fas)

src_snake := examples/snake.fas
src_minesweeper := examples/mines.fas
src_square := examples/square.fas

.PHONY: all $(EXAMPLES) $(addprefix run-,$(EXAMPLES))
all: $(EXAMPLES)

$(EXAMPLES): %: build/%

.SECONDEXPANSION:
build/%: $$(src_$$*) $(ENGINE)
	mkdir -p build
	$(FAS) $< -o $@

$(addprefix run-,$(EXAMPLES)): run-%: build/%
	./build/$*
