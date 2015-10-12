//Recursive Descent Parsing

#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#define DONE 260
#define NUM 257
#define ID 259
void E();
void T();
void F();
void parser();
int lexer();
void match(int);
void parsex();
int i=0,flag=9,lkahd;
char inp[75];
int cnt=-1;

int main()
{
 int i=-1;
 char c;
 FILE *fp;
 fp=fopen("input.txt","rt");
 while((c=fgetc(fp))!=EOF)
 {
  inp[i++]=c;
 }
 inp[i]=EOF;
 parser();
}

int lexer()
{
 int t;
 while(1)
 {
  t=inp[cnt++];
  if(t==' '||t=='\t'||t=='\n')
  ;
  else if(t=='+'||t=='-'||t=='*'||t=='/')
  {
   printf("Arithmetic Operator :  %c\n",t);
   return t;
  }
  else if(isdigit(t))
  {
   printf("\n Number :  %c\n",t);
   return NUM;
  }
  else if(isalpha(t))
  {
   printf("\n Identifier : %c\n",t);
   return ID;
  }
  else if(t==EOF)
   return DONE;
  else
   return t;
 }
}

void parser()
{
 lkahd=lexer();
 while(lkahd!=DONE)
 {
  E();
  match(';');
 }
 if(lkahd==DONE)
  parsex();
}

void match(int t)
{
 if(lkahd==t)
  lkahd=lexer();
 else
  return;
}

void F()
{
 switch(lkahd)
 {
  case '(':match('(');
	   E();
	   match(')');
	   break;
  case NUM:match(NUM);
	   break;
  case ID:match(ID);
	  break;
  default:{
	   printf("Syntax Error...");
	   flag=7;
	  }
 }
}

void T()
{
 int t;
 F();
 while(1)
 {
  switch(lkahd)
  {
   case '*':t=lkahd;
	    match(lkahd);
	    F();
	    continue;
   case '/':t=lkahd;
	    match(lkahd);
	    F();
            continue;
   default:return;
  }
 }
}

void E()
{
 int t;
 T();
 while(1)
 {
  switch(lkahd)
  {
   case '+':t=lkahd;
	    match(lkahd);
	    T();
	    continue;
   case '-':t=lkahd;
	    match(lkahd);
	    T();
	    continue;
   default:return;
  }
 }
}

void parsex()
{
 if(flag!=7)
  printf("Parse Successfull...!!!\n");
 else
  printf("parse successfull\n Errors found\n");
  exit(0);
}




