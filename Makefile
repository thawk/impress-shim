# Listing all sources
SOURCES = $(wildcard src/[^_]*.scss)

TARGETS = $(patsubst %, themes/%, $(notdir $(SOURCES:.scss=.css)))

all: $(TARGETS)

themes/%.css:src/%.scss src/_common.scss
	npx sass --no-error-css $< $@

.PHONY: clean
clean:
	rm $(TARGETS)

