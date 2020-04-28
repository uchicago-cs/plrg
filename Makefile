###########
# uncomment if you want to use C macros on your markdown
# FLAGS=-Wno-invalid-pp-token
# PROCESS=gcc $(FLAGS) -E -x c -P -C -traditional-cpp -I ./src/include

PROCESS=cat

rebuild: clean website

website: format index.html

index.html: src/index.md
	$(PROCESS) $^ | multimarkdown > index.html

format:
	ruby format_table.rb src/index.md

clean:
	rm -f index.html

spellcheck: src/index.md
	aspell -c $^

watch:
	fswatch -l 0.1 -Ee "git|index.html|styles.css" . | xargs -ton 1 sh -c "make"
