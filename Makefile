###########
# uncomment if you want to use C macros on your markdown
# FLAGS=-Wno-invalid-pp-token
# PROCESS=gcc $(FLAGS) -E -x c -P -C -traditional-cpp -I ./src/include

PROCESS=cat

rebuild: clean website

website: index.html

index.html: src/index.md
	$(PROCESS) $^ | multimarkdown > index.html
    
clean:
	rm -f index.html

spellcheck: src/index.md
	aspell -c $^
