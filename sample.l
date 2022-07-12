%{
  /* definitions*/
%}

%option noyywrap

/* rules*/
%%
("int")|("if")|("else")|("while")|("do")|("break")|("continue")|("double")|("float")|("return")|("EOF") {printf("\nKeyword:                %s\n",yytext);}

[''|,|;(|)|{|}|.|_] { printf("Punctuation:            %s\n",yytext);}

[a-zA-Z_][a-zA-Z0-9_]* {printf("Identifier:             %s\n",yytext);}

"="  {printf("Assignment Operator:    %s\n",yytext);}

"<="|">="|"!="|"=="|"<"|">"  {printf("Relational Operator:    %s\n",yytext);}

"+"|"-"|"*"|"/"  {printf("Arithmetic Operator:    %s\n",yytext);}

[0-9]+ {printf("Integer:                %s\n",yytext);}

["]([^"\\\n]|\\.|\\\n)*["] {printf("String:                 %s\n\n",yytext);}

"//".*" "*    {printf("Comment:                %s\n",yytext);}

" " {printf("\b");}



[\t\n]+
%%


int main(int argc, char *argv[]) {
extern FILE *yyin,*yyout;
printf("Token                   Lexeme\n");
printf("==============================\n");
yyin = fopen("source.txt", "r");

yylex();
  return 0;
}
