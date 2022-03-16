all: lex yacc 
	c++ lex.yy.c y.tab.c -o project -ll -g

yacc: project.y
	yacc -d project.y

lex: project.l
	lex project.l

clean:
	rm project y.tab.c y.tab.h lex.yy.c
run: exampleInput1.txt 
	./project  exampleInput1.txt