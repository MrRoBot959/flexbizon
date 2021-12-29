%{
#include "calc.tab.h"
void yyerror (char *s);
int yylex();
%}
%%

"exit"				   {return exit_command;}
[0-9]+                 {yylval.num = atoi(yytext); return number;}
[ \t\n]                ;
[+*()-;]           	   {return yytext[0];}
.                      {ECHO; yyerror ("unexpected character");}

%%
int yywrap (void) {return 1;}

