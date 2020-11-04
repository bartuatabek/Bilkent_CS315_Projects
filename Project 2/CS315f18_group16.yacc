%token TRUE FALSE FUNC MOVE TURN GRAB FROM TO RELEASE READDATA SENDDATA PRINT BEGINS END RETURN ITERATE IF ELSE VAR NUMBER chars DIVIDE MULTIPLY PLUS MINUS MOD EQUAL EQUALITY NOTEQUAL LESSOREQUAL GREATEROREQUAL LESS GREATER NOT AND OR PASSES L_PRNT R_PRNT COMMA
%%
program: program_definition {printf("Syntax is valid\n"); return 0;};
program_definition: function_definition | stmt |program_definition function_definition | program_definition stmt;
function_definition: FUNC chars PASSES function_parameters BEGINS stmts END
                   | FUNC IDENTIFIER BEGINS stmts END
                   | FUNC IDENTIFIER PASSES function_parameters BEGINS stmts RETURN expression_stmt END
                   | FUNC IDENTIFIER BEGINS stmts RETURN expression_stmt END;
function_parameters: VAR IDENTIFIER | function_parameters COMMA VAR IDENTIFIER;
stmts: stmt | stmt stmts;
stmt: conditional_stmt | loop_stmt | variable_declaration | assignment_stmt | expression_stmt| function_call_stmt;
factor: NUMBER | IDENTIFIER | L_PRNT numerical_expressions R_PRNT;
numerical_expressions: numerical_expressions PLUS divide_and_multiply
                     |numerical_expressions MINUS divide_and_multiply
                     |divide_and_multiply;
divide_and_multiply: divide_and_multiply MULTIPLY mod
                   |divide_and_multiply DIVIDE mod
                   |mod;
mod: mod MOD factor | factor;
assignment_stmt: IDENTIFIER EQUAL numerical_expressions
               |IDENTIFIER EQUAL function_call_stmt
               |VAR IDENTIFIER EQUAL expression_stmt
               |VAR IDENTIFIER EQUAL function_call_stmt
               |IDENTIFIER EQUAL conditional_expression;
variable_declaration: VAR IDENTIFIER;
function_call_stmt: IDENTIFIER PASSES function_arguments | primitive_function_structure;
function_names: MOVE | TURN | GRAB | RELEASE | READDATA | SENDDATA | PRINT;
primitive_function_structure: function_names PASSES expression_stmt COMMA expression_stmt
                            | function_names PASSES expression_stmt
                            | function_names;
function_arguments: expression_stmt | function_arguments COMMA expression_stmt;
logical_value: TRUE | FALSE;
conditional_expression: logical_value
                      | conditional_expression_rules | NOT conditional_expression_rules
                      | NOT IDENTIFIER | NOT logical_value;
conditional_expression_rules: cond_expr_NTF | cond_expr_TF;
cond_expr_NTF: ident_number logic_opr_NTF ident_number | ident_number logic_opr_B ident_number;
logic_opr_NTF: LESSOREQUAL | GREATEROREQUAL | LESS | GREATER;
logic_opr_B: NOTEQUAL | EQUALITY;
logic_opr_TF: AND | OR;
cond_expr_TF: ident_logic logic_opr_TF ident_logic | logical_value logic_opr_B logical_value;
ident_number: numerical_expressions;
ident_logic: logical_value | IDENTIFIER;
conditional_expression_wident: conditional_expression | IDENTIFIER;
conditional_stmt: IF conditional_expression_wident BEGINS stmts END ELSE BEGINS stmts END
                | IF conditional_expression_wident BEGINS stmts END;
loop_stmt: for_loop | while_loop;
for_loop: ITERATE FROM numerical_expressions TO numerical_expressions BEGINS stmts END;
while_loop: ITERATE IF conditional_expression BEGINS stmts END;
expression_stmt: conditional_expression | numerical_expressions;
%%
#include "lex.yy.c"
void yyerror(char *s){
	printf("%s, line: %d\n", s, yylineno);
}
int main(){
   yyparse();
}
