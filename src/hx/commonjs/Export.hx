package hx.commonjs;

import haxe.macro.Context;
import haxe.macro.Expr;

class Export
{
    static public var initialized:Bool = false;

    macro
    static public function set(field:String, className:String):Expr
    {
        if (!initialized) {
            Context.defineType(
            {
                pos: Context.currentPos(),
                params:[],
                pack:["module"],
                name: "exports",
                meta: [],
                kind: TDClass(),
                isExtern: false,
                fields: []
            }
            );

            initialized = true;
        }

        return Context.parse("Reflect.setField(Type.resolveClass(" + 
                             "\"module.exports\"), \"" + field + "\", " + 
                             className + ")", 
                             Context.currentPos());
    }
}