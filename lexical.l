%{ 
    #include <stdio.h>
    #include <stdlib.h>
    
    int nb_ligne = 1;
%}

idf [a-zA-Z]([a-zA-Z]|[0-9])*
cst [1-9][0-9]*|0

%%

DEBUT               {printf("DEBUT est le debut de programme\n");}
EXECUTION           {printf("EXECUTION de programme\n");}
FIN                 {printf("Fin de programme\n");}

NUM                 {printf("NUM est un integer\n");}
REAL                {printf("REAL est un real\n");}
TEXT                {printf("TEXT est un text\n");}

FIXE                {printf("Fixe est une constante\n");}

SI                  {printf("SI est si\n");}
ALORS               {printf("ALORS est alors\n");}
SINON               {printf("SINON est sinon\n");}
TANTQUE             {printf("TANTQUE est un tantque\n");}
FAIRE               {printf("FAIRE est faire\n");}

"<-"                {printf("Lopération <- est un affectation\n");}
"+"                 {printf("Lopération + est un plus\n");}
"-"                 {printf("Lopération - est un moins\n");}
"*"                 {printf("Lopération * est une multiplication\n");}
"/"                 {printf("Lopération / est une division\n");}
ET                  {printf("Lopération ET logique\n");}
OU                  {printf("Lopération OU logique\n");}
NON                 {printf("Lopération NON est une négation logique\n");}
"="                 {printf("Lopération = est une égalité de comparaison\n");} 
"!="                {printf("Lopération != est une inégalité de comparaison\n");}
"<"                 {printf("Lopération < est inférieur en comparaison\n");}    
"<="                {printf("Lopération <= est inférieur ou égal en comparaison\n");}
">"                 {printf("Lopération > est supérieur en comparaison\n");}
">="                {printf("Lopération >= est supérieur ou égal en comparaison\n");}

":"                 {printf("Lopérande : est un deux-points\n");}
"("                 {printf("Lopérande ( est une parenthèse ouvrante\n");}
")"                 {printf("Lopérande ) est une parenthèse fermante\n");}
"{"                 {printf("Lopérande { est un crochet ouvrant\n");}
"}"                 {printf("Lopérande } est un crochet fermant\n");}

"_"                 {printf("Lopérande _ est un tiret 8\n");}

"affiche"           {printf("affiche est printf\n");}
"lire"              {printf("lire est scanf\n");}

{idf}               {printf("%s est un idf\n", yytext);}

[ \t]+              { /* Ignorer les espaces et les tabulations */ }
\n                  { nb_ligne++; }
.                   { printf("Caractère non reconnu : %s\n", yytext); }

%%

int main() {
    printf("Analyse lexicale : Entrez le texte à analyser.\n");
    yylex();
    printf("Analyse terminée. Nombre de lignes lues : %d\n", nb_ligne);
    return 0;
}
