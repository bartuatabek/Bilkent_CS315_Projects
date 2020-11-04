%option main
alphabetic [A-Za-z_$]
digit [0-9]
alphanumberic ({alphabetic}|{digit})
%%
true printf("TRUE\n");
false printf("FALSE\n");
func printf("FUNC\n");
move printf("MOVE\n");
turn printf("TURN\n");
grab printf("GRAB\n");
from printf("FROM\n");
to printf("TO\n");
release printf("RELEASE\n");
readData printf("READDATA\n");
sendData printf("SENDDATA\n");
print printf("PRINT\n");
begin printf("BEGIN\n");
end printf("END\n");
return printf("RETURN\n");
iterate printf("ITERATE\n");
if printf("IF\n");
else printf("ELSE\n");
var printf("VAR\n");
{digit}+(\.{digit}+)? printf("NUMBER\n");
{alphabetic}|{alphanumberic}* printf("IDENTIFIER\n");
\/ printf("DIVIDE\n");
\* printf("MULTIPLY\n");
\+ printf("PLUS\n");
\- printf("MINUS\n");
\% printf("MOD\n");
= printf("EQUAL\n");
== printf("EQUALITY\n");
~= printf("NOTEQUAL\n");
\<= printf("LESSOREQUAL\n");
\>= printf("GREATEROREQUAL\n");
\< printf("LESS\n");
\> printf("GREATER\n");
~ printf("NOT\n");
\& printf("AND\n");
\| printf("OR\n");
\<\- printf("PASSES\n");
\( printf("L_PRNT\n");
\) printf("R_PRNT\n");
\, printf("COMMA\n");
#.*\n ;
\n ;
. ;




