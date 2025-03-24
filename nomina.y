%{
#include <stdio.h>
#include <stdlib.h>

int sueldo = 0, horas_extra = 0, bono = 0, impuesto = 0, seguro = 0;

int yylex();
void yyerror(const char *s);
%}

%union {
    int num;
}

%token <num> NUM
%token SUELDO HORAS_EXTRA BONO IMPUESTO SEGURO

%%

nomina:
    datos { 
        float sueldo_bruto = sueldo + (horas_extra * (sueldo / 160)) + bono;
float descuento = (sueldo * impuesto / 100) + (sueldo * seguro / 100);
float sueldo_neto = sueldo_bruto - descuento;
        printf("\nSueldo Neto: %.2f\n", sueldo_neto);
    }
    ;

datos:
    datos dato
    |
    ;

dato:
    SUELDO NUM         { sueldo = $2; }
    | HORAS_EXTRA NUM  { horas_extra = $2; }
    | BONO NUM         { bono = $2; }
    | IMPUESTO NUM     { impuesto = $2; }
    | SEGURO NUM       { seguro = $2; }
    ;

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
