%{
#include "calclogique.tab.h"
void yyerror (char *s);
int yylex();
%}
%%

"vrai"                {yylval.b = 1; return bool;}
"faux"                {yylval.b = 0; return bool;}
[ \t\n]                ;
[&!|;]                {return yytext[0];}
.                     {ECHO; yyerror ("unexpected character");}

%%
int yywrap (void) {return 1;}

