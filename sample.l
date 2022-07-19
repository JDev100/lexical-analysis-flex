%{
  /* definitions*/
%}

%option noyywrap

/* rules*/
%%
("int")|("if")|("else")|("while")|("do")|("break")|("continue")|("double")|("float")|("return") {fprintf(yyout,"\nKeyword:                %s\n",yytext);}

[''|,|;(|)|{|}|.|_] { fprintf(yyout,"Punctuation:            %s\n",yytext);}

[a-zA-Z_][a-zA-Z0-9_]* {fprintf(yyout,"Identifier:             %s\n",yytext);}

"="  {fprintf(yyout,"Assignment Operator:    %s\n",yytext);}

"<="|">="|"!="|"=="|"<"|">"  {fprintf(yyout,"Relational Operator:    %s\n",yytext);}

"+"|"-"|"*"|"/"  {fprintf(yyout,"Arithmetic Operator:    %s\n",yytext);}

[0-9]+ {fprintf(yyout,"Integer:                %s\n",yytext);}

["]([^"\\\n]|\\.|\\\n)*["] {fprintf(yyout,"String:                 %s\n\n",yytext);}

"//".*" "*    {fprintf(yyout,"Comment:                %s\n",yytext);}

. {fprintf(yyout,"",yytext);}
%%


int main(int argc, char *argv[]) {
extern FILE *yyin,*yyout;
  yyin = fopen("source.txt", "r");
  yyout = fopen("output.txt", "w");

  fprintf(yyout, "Token                   Lexeme\n");
  fprintf(yyout, "==============================\n");

  yylex();
  return 0;
}
