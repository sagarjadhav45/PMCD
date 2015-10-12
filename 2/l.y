
%{
#include<stdio.h>
#include<math.h>
void yyerror(char *);
%}
 
 
%union
{
    double dval;
}
 
 
%token <dval> NUM
%token SIN COS TAN SQRT LOG
%right '~'
%left '+' '-'
%left '*' '/'
%type <dval> expression
 
 
%%
program: program statement'\n'
    | 
    ;
 
 
statement: 
      expression  { printf("Value is:%lf \n", $1); }
      ;
 
 
expression:  
        NUM
        | expression '+' expression  {$$ = $1 + $3;}
        | expression '-' expression  {$$ = $1 - $3;}
        | expression '*' expression  {$$ = $1 * $3;}
        | expression '/' expression  {$$ = $1 / $3;}             
        | '~' expression  {$$ = -(1) * $2;}
        | SQRT'('expression')'  {$$ = sqrt( $3 );}
        | SIN'('expression')'   {$$ = sin ($3*3.142/180);}
        | COS'('expression')'   {$$ = cos ($3*3.142/180);}
        | TAN'('expression')'   {$$ = tan ($3*3.142/180);}
	| LOG'('expression')'   {$$ = log ($3);}
        ;
%%
 
 
 main()
{	
printf("Enter the Expression \n");
    yyparse();
}
 
 
void yyerror(char *s)
{
    fprintf(stderr,"%s\n",s);
}
 

 

