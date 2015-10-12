%{
#include<stdlib.h>
#include<stdio.h>
#include<string.h>
int nindex=0;
char temp='A';
char AddintoTable(char op1,char op2,char op);
void Qudraple();
void ThreeAddressCode();
struct InstFormat
{
  char op1;
  char op2;
  char op;
};

%}

%union
{
  char p;
}

%token<p>Letter Digit
%type<p>expr
%left'-''+'
%right'*''/'

%%
Stat : Letter'='expr';' {AddintoTable((char)$1,(char)$3,'=');}
     | expr';'
     ;
     
expr : expr'+'expr {$$=AddintoTable ((char)$1,(char)$3,'+');} 
     | expr'-'expr {$$=AddintoTable ((char)$1,(char)$3,'-');}
     | expr'*'expr {$$=AddintoTable ((char)$1,(char)$3,'*');}
     | expr'/'expr {$$=AddintoTable ((char)$1,(char)$3,'/');}     
     | '('expr')' {$$=(char)$2;}
     | '-'expr {$$=(char)$2;}
     |Digit {$$=(char)$1;}
     |Letter {$$=(char)$1;}
     ;
%%

int yyerror(char *msg)
{
  printf("Invalid expression......\n");
  exit(0);
}   

struct InstFormat TACode[20];

char AddintoTable(char op1,char op2,char op)
{
 // char temp='A';
  TACode[nindex].op1=op1;
  TACode[nindex].op2=op2;
  TACode[nindex].op=op;
//printf("\n%c %c %c",TACode[nindex].op1,TACode[nindex].op,TACode[nindex].op2);
  nindex++;
  temp++;
  return temp;
}

void ThreeAddressCode()
{
  int cnt=0;
  char temp='A';
  printf("\n\n\t Three Address Code\n\n");
  temp++;
  while(cnt<nindex)
  {
    printf("%c :=\t",temp);
    if(isalpha(TACode[cnt].op1))
      printf("%c\t",TACode[cnt].op1);
    else
      printf("%c\t",temp);
    
    printf("%c\t",TACode[cnt].op);
    
    if(isalpha(TACode[cnt].op2))
      printf("%c\t",TACode[cnt].op2);
    else
      printf("%c\t",temp);
    printf("\n");
    cnt++;
    temp++;
  }
}

void Quadraple()
{
  int cnt=0;
  char temp='A';
  temp++;
  printf("\n\n\tQuadraple\n");
  printf("\nID Operator Operand1 Operand2 Result\n"); 
  while(cnt<nindex)
  {
    printf("\n(%d)\t%c\t",cnt,TACode[cnt].op);
    if(isalpha(TACode[cnt].op1))
      printf("%c\t",TACode[cnt].op1);
    else
      printf("%c\t",temp);
    
    if(isalpha(TACode[cnt].op2))
      printf("%c\t",TACode[cnt].op2);
    else
      printf("%c\t",temp);
    printf("%c\t",temp); 
    printf("\n");
    cnt++;
    temp++; 
  }
}

main()
{
  printf("\nEnter expression:");
  yyparse();
  ThreeAddressCode();
  Quadraple(); 
}

yywrap()
{
  return 1;
}
