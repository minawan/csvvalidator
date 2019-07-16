grammar CsvSchema;

schema
    : prolog body
    ;

prolog
    : VersionDecl globalDirectives
    ;

VersionDecl
    : 'version 1.0'
    | 'version 1.1'
    ;

globalDirectives
    : totalColumnsDirective?
    ;

DirectivePrefix
    : '@'
    ;

totalColumnsDirective
    : DirectivePrefix 'totalColumns' PositiveNonZeroIntegerLiteral
    ;

PositiveNonZeroIntegerLiteral
    : [1-9][0-9]*
    ;

body
    : bodyPart+
    ;

bodyPart
    : 'unimplemented'
    | isExpr
    ;

isExpr
    : 'is(' StringLiteral ')'
    ;

StringLiteral
    : '"' ~["]* '"'
    ;

SingleLineComment
    : '//' ~[\r\n]*
      -> skip
    ;

MultiLineComment
    : '/*' .*? '*/'
      -> skip
    ;

WS : [ \t\r\n]+ -> skip;
