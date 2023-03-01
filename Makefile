INC=include
default: main
main:
	bison -t src/parse.y --output=src/parse.tab.c --defines=include/parse.tab.h
	flex --outfile=src/lex.yy.c src/lex.l
	g++ -I $(INC) src/parse.tab.c src/AST.cpp src/lex.yy.c -o main
clean:
	rm -f main src/parse.tab.c src/parse.tab.h src/lex.yy.c include/parse.tab.h