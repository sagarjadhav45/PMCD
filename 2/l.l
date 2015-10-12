%{
#include"y.tab.h"
#include<stdio.h>
void yyerror(char *);
%}
 
 
%%
(([0-9]+)|([0-9]*\.[0-9]+))   {
    yylval.dval=atof(yytext);                
    return NUM;
}
 
 
[+-/*\n,~()]  {return (*yytext);}
 
 
sin   {return SIN;}
cos   {return COS;}
tan   {return TAN;}
sqrt  {return SQRT;}
log  {return LOG;}
exit  exit(0);
[ \t]  
%%
 
 
 
 
int yywrap(void)
{
    return 1;
}
 


