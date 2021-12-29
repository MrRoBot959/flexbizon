%{
void yyerror (char *s);
int yylex();
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>



%}

%union {int b;}         /* Yacc definitions */

%left '&'
%left  '|'
%right '!'







%token <b> bool



%type  <b>  E T F EXP

%%

EXP: E';' {
        if($$==1){
            printf("\nResult=vrai\n");
        }else{
            printf("\nResult=faux\n");
        }
         
  
         return 0;
  
        };


E : E'&'T  {$$ = $1 * $3;}
  | T        {$$=$1;}
  ; 

T : T'|'F  {if(($1 + $3)>0){
                    $$=1;
                }else{
                    $$=0;
                };}
  | F 
  ;



F : '!'F {
            if($$==1){
                $$=0;
            }else{
                $$=1;
            }
            }
  | bool  {$$ = $1;}
  ;




%%

int main (void) {
	

	return yyparse ();
}





void yyerror (char *s) {fprintf (stderr, "%s\n", s);} 

