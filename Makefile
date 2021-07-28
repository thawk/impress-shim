all: css

%:
	@:

.PHONY: css
css:
	@make -C impressjs/css

.PHONY: clean
clean:
	@make -C impressjs/css clean
