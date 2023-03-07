/* jflex BoxWorld */
/* Autor: Bladimir*/

package compilador;

import java_cup.runtime.*;

%%

%public
%class IdLexer
%cup


digito = [0-9]
letra = [a-zA-Z]
espaciosBlanco = [ \t\n]

%{
    StringBuffer string = new StringBuffer();
  private Symbol symbol(int type){
      return new Symbol(type, yyline, yycolumn);
  }

  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline, yycolumn, value);
  }
%}
//para el finale de el textoi o archivo

%eofval{
    return symbol(ParserSym.EOF);
%eofval}

%%

{digito}+ { return symbol(ParserSym.NUMERO, Integer.valueOf(yytext())); }
"(" { return symbol(ParserSym.APAREN, yytext());}
")" { return symbol(ParserSym.CPAREN, yytext());}
"*" { return symbol(ParserSym.MULTIPLICACION, yytext());}
"/" { return symbol(ParserSym.DIVICION, yytext());}
"+" { return symbol(ParserSym.SUMA, yytext());}
"-" { return symbol(ParserSym.RESTA, yytext());}

{espacioBlanco}+ {/*skip white space*/}

[^]   {throw new Error("cadena ilegal <"+yytext()+">");}