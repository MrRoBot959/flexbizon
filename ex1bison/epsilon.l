%{
#include "epsilon.tab.h"
void yyerror (char *s);
int yylex();
%}
%%

"0"  {return zero;}
"1"  {return un;}
"+"  {return plus;}
"*"  {return etoile;} 
"("  {return po;}
")"  {return pf;}
"\n" {return nligne;}
[ \t] ;


%%
int yywrap (void) {return 1;}