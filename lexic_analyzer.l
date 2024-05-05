%{
#include <stdio.h>
%}

%option noyywrap

%%
[0-9]+                                  { printf("inum "); }
[+-]?([0-9]*\.[0-9]{1,5}|[0-9]+)        { printf("fnum "); }
i                                       { printf("intdc "); }
f                                       { printf("floatdcl "); }
p                                       { printf("print "); }
[a-eghj-oq-z]                           { printf("id "); }
=                                       { printf("assign ");}
\+                                      { printf("plus ");}
\/\/.*                                  { printf("COMMENT"); }
\n                                      { printf("\n"); }
[ \t]+                                  /* ignore whitespace */
%%

int main() {
    yylex();
    return 0;
}
