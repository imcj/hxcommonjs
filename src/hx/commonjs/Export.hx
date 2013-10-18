package hx.commonjs;

#if macro
import haxe.macro.Context;
import haxe.macro.Expr;
#end

@:autoBuild(hx.commonjs.Macro.build())
class Export
{
    #if macro
    static function ident(const):String
    {
        var id:String = "";
        switch(const) {
            case EConst(c): {
                trace("hello");
                switch (c) {
                    case CIdent(s): {
                        id = s;
                    }
                    default:
                }
            }
            default:
        }

        return id;
    }
    #end

    function include(arg)
    {

    }
}