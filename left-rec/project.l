
%{
  #include <stdio.h>
  #include <string.h>
  #include "y.tab.h"
  #include <iostream>
  using namespace std;
  int linenum=1;
%}
%%

\<[A-Z][A-Z]*[a-z]*\> {yylval.str = strdup(yytext); return NONTERMINAL;}
[A-Z][A-Z]*[a-z]*\> {yylval.str = strdup(yytext); return ERRORNONO;}
\<[A-Z][A-Z]*[a-z]* {yylval.str = strdup(yytext); return ERRORNONC;}
[a-z]  {yylval.str = strdup(yytext); return TERMINAL;}
\-> return RULEOPERATOR;
'' return SPACE;
\; return SEMICOLON;
"epsilon" {yylval.str = strdup(yytext); return EPSILON;}
\n	{linenum++;} 
[ \t]+
%%