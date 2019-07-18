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
    | columnDefinition
    ;

columnDefinition
    : ColumnIdentifier ':' singleExpr
    ;

singleExpr
    : isExpr
    | notExpr
    ;

isExpr
    : 'is(' StringLiteral ')'
    ;

notExpr
    : 'not(' StringLiteral ')'
    ;

ColumnIdentifier
    : (('A .. Z') | ('a' .. 'z') | ('0' .. '9' ) | [-_.])+
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
