alphabetic [A-Za-z_$]
digit [0-9]
alphanumberic ({alphabetic}|{digit})
int yylineno = 1;
%%
true return TRUE;
false return FALSE;
func return FUNC;
move return MOVE;
turn return TURN;
grab return GRAB;
from return FROM;
to return TO;
release return RELEASE;
readData return READDATA;
sendData return SENDDATA;
print return PRINT;
end return END;
return return RETURN;
begin return BEGINS;
iterate return ITERATE;
if return IF;
else return ELSE;
var return VAR;
{digit}+(\.{digit}+)? return NUMBER;
{alphabetic}|{alphanumberic}* return IDENTIFIER;
\/ return DIVIDE;
\* return MULTIPLY;
\+ return PLUS;
\- return MINUS;
\% return MOD;
= return EQUAL;
== return EQUALITY;
~= return NOTEQUAL;
\<= return LESSOREQUAL;
\>= return GREATEROREQUAL;
\< return LESS;
\> return GREATER;
~ return NOT;
\& return AND;
\| return OR;
\<\- return PASSES;
\( return L_PRNT;
\) return R_PRNT;
\, return COMMA;
#.*\n yylineno++;
\n yylineno++;
. ;
%%
int yywrap(){
   return 1;
}
