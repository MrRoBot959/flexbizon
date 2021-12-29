%{
void yyerror (char *s);
int yylex();
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>



%}

%union {int num;}         /* Yacc definitions */

%left '+'
%left '*'






%token exit_command
%token <num> number


%type  <num>  E T F EXP

%%

EXP: E';' {
  
         printf("\nResult=%d\n", $$);
  
         return 0;
  
        };

E : E '+' T  {$$ = $1 + $3;}
  | T 
  ;

T : T '*' F  {$$ = $1 * $3;}
  | F        {$$=$1;}
  ; 

F : '(' E ')'  {$$ = $2;}
  | '-' F      {$$ = -$2;}
  | number
  ;




%%

int main (void) {
	

	return yyparse ();
}





void yyerror (char *s) {fprintf (stderr, "%s\n", s);} 

