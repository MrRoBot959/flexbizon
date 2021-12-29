%{
void yyerror (char *s);
int yylex();
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>



%}

%token zero un etoile plus po pf nligne 

%%


S : 
  | S E
  ;

E : nligne 
  | R nligne  {printf("expression reg valide !");printf("Sa taille est >> %d\n", $1);$1=0;printf("donner autre");}
  ;
R : zero {$$++;}
  | un   {$$++;} 
  | po R pf { $$ = $2; }
  | R R { $$ = $1 + $2 + 1; }
  | R plus R { $$ = $1 + $3 + 1; }
  | R etoile { $$ = $1 + 1; }
  ;

%%

int main (void) {
	

	return yyparse ();
}





void yyerror (char *s) {fprintf (stderr, "%s\n", s);} 
