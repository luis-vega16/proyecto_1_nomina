lex nomina.l

yacc -d nomina.y

gcc lex.yy.c y.tab.c -o nomina -ll
