%{
#include <stdio.h>
%}

%%
" in "              { fprintf(yyout, " int "); }
" s "               { fprintf(yyout, " switch "); }
" c "               { fprintf(yyout, " case "); }
" b "               { fprintf(yyout, " break "); }
" fl "              { fprintf(yyout, " float "); }
" ch "              { fprintf(yyout, " char "); }
" ch* "              { fprintf(yyout, " char* "); }
" db "              { fprintf(yyout, " double "); }
" i "               { fprintf(yyout, " if "); }
" e "               { fprintf(yyout, " else "); }
" w "               { fprintf(yyout, " while "); }
" f "               { fprintf(yyout, " for "); }
" d "               { fprintf(yyout, " do "); }
" r "               { fprintf(yyout, " return "); }
" v "               { fprintf(yyout, " void "); }
" cn "              { fprintf(yyout, " const "); }
"#inc "             { fprintf(yyout, "#include "); }
" mll"             { fprintf(yyout, " malloc "); }
" cll"             { fprintf(yyout, " calloc ");  }
" pf"              { fprintf(yyout, " printf "); }
" scpy"            { fprintf(yyout, " strcpy ");  }
" scat"            { fprintf(yyout, " strcat ");  }
" slen"            { fprintf(yyout, " strlen ");  }
.                   { fprintf(yyout, "%c", yytext[0]); }

%%
int main(int argc, char **argv) {
    if (argc != 3) {
        printf("Uso: %s archivo_entrada archivo_salida\n", argv[0]);
        return 1;
    }

    FILE *entrada = fopen(argv[1], "r");
    FILE *salida = fopen(argv[2], "w");

    if (!entrada) {
        printf("No se pudo abrir el archivo de entrada\n");
        return 1;
    }

    if (!salida) {
        printf("No se pudo abrir el archivo de salida\n");
        fclose(entrada);
        return 1;
    }

    yyin = entrada;
    yyout = salida;

    yylex();

    fclose(entrada);
    fclose(salida);
    return 0;
}