%{

#include<stdio.h>
#include<string.h>
#define keywords 1
#define digit 2
#define identifier 3
#define relop 4
#define preprocessor 5
#define head 6
#define punctuation 7
#define assign 8
#define literals 9
#define formatsp 10
#define IOFUN 11
#define arith 12

%}

%option noyywrap
preproc "#"

keyword "int"|"float"|"char"|"break"|"return"|"switch"|"case"|"for"|"while"|"do"|"printf"|"scanf"|"void"|"main"|"include"

digit[0-9]+

identifier[A-Za-z][A-Za-z0-9_]*

relationalops "<"|">"|"<="|">="

header [a-z]+[.]+[h]

punctuation ","|"."|";"|"{"|"}"|"["|"]"|"("|")"|["]

assign "="

literal ["][A-Za-z0-9]+["]

format [%][a-z]+

arith "+"|"-"|"*"|"/"

%%


{keyword} {return 1;}
{digit} {return 2;}
{identifier} {return 3;}
{relationalops} {return 4;}
{preproc} {return 5;}
{header} {return 6;}
{punctuation} {return 7;}
{assign} {return 8;}
{literal} {return 9;}
{format} {return 10;}
{arith} {return 12;}

                

%%

struct struct1
{
 int size;
 char type[20],name[20];
}s[100];

void main()
{

int a=0;
int i=0,j,flag;
while(a = yylex())
{
switch(a)
{
	case 1:
		printf("\nKeyword::%s",yytext);
		if(strcmp(yytext,"int")==0)
		{
			for(j=i;j<(i+8);j++)
			  strcpy(s[j].type,"int");
			 
		}
		if(strcmp(yytext,"float")==0)
		{
			for(j=i;j<(i+8);j++)
			  strcpy(s[j].type,"float");
			 
		}
		if(strcmp(yytext,"char")==0)
		{
			for(j=i;j<(i+8);j++)
			  strcpy(s[i].type,"char");
			 
		}
		if(strcmp(yytext,"long")==0)
		{
			for(j=i;j<(i+8);j++)
				strcpy(s[i].type,"long");
				
		}
		
		break;
	case 2:
		printf("\nDigit is::%s",yytext);
		break;
	case 3:
		printf("\nIdentifier :%s",yytext);
		flag=0;
		for(j=0;j<i;j++)
		{
			if(strcmp(s[j].name,yytext)==0)
				flag=1;	
		}
		if(flag==0)
		{
		 strcpy(s[i].name,yytext);
		if(strcmp(s[i].type,"int")==0)
			s[i].size=sizeof(int);
		if(strcmp(s[i].type,"float")==0)
			s[i].size=sizeof(float);
		if(strcmp(s[i].type,"char")==0)
			s[i].size=sizeof(char);
		if(strcmp(s[i].type,"long")==0)
			s[i].size=sizeof(long);
		 i++;
		}
		break;
	case 4:
		printf("\nRelational Operator is::%s",yytext);
		break;
	case 5:
		printf("\nPreprocessor is::%s",yytext);
		break;
	case 6:
		printf("\nHeader file is::%s",yytext);
		break;
	case 7:
		printf("\nPunctuation is::%s",yytext);
		break;
	case 8:
		printf("\nAssignment Operator::%s",yytext);
		break;
	case 9:
		printf("\nLiteral::%s",yytext);
		break;
	case 10:
		printf("\nFormat Specifier::%s",yytext);
		break;
	case 12:
		printf("\nArithmatic Operator::%s",yytext);
		break;
	}


}
	printf("\nID\t NAME \t\t TYPE \t\t\t SIZE\n");
  	for(j=0;j<i;j++)
	{
		printf("%d \t %s\t\t %s \t\t %d\n",j,s[j].name,s[j].type,s[j].size);
	}






}
