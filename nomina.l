%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}

%%
[ \t\n]           ;  // Ignorar espacios y saltos de línea
[0-9]+            { yylval.num = atoi(yytext); return NUM; }
SUELDO            { return SUELDO; }
HORAS_EXTRA       { return HORAS_EXTRA; }
BONO             { return BONO; }
IMPUESTO         { return IMPUESTO; }
SEGURO           { return SEGURO; }
.                { printf("Caracter no reconocido: %s\n", yytext); }
%%

int yywrap() { return 1; }
