package hx.commonjs;

#if macro

import haxe.macro.Type;
import haxe.macro.Expr;
import haxe.macro.Context;

class Macro
{
    macro
    static public function build():Array<Field>
    {
        var field;
        var fields = Context.getBuildFields();
        var size = fields.length;
        var methodMain;
        var methodCall;
        var namespace;
        var name;

        for (i in 0...size) {
            field = fields[i];

            if ("main" == field.name) {
                methodMain = field;
            }

            if ("__call__" == field.name) {
                methodCall = field;
            }
        }
        fields.remove(methodMain);

        if (methodCall != null) {
            namespace = [];
            name = "module";
            methodCall.name = "exports";
            fields = [methodCall];
        } else {
            namespace = ["module"];
            name = "exports";
        }

        if (null == methodMain)
            throw "Main does not have static function main.";

        Context.defineType({
            pos: Context.currentPos(),
            params:[],
            pack: namespace,
            name: name,
            meta: [],
            kind: TDClass(),
            isExtern: false,
            fields: fields
        });

        // Context.onGenerate(onGenerate);
        return [methodMain];
    }

    // static function onGenerate(types:Array<haxe.macro.Type>):Void
    // {
    //     var localClass = Context.getLocalClass();
    //     var methodMain;
    //     for (field in localClass.get().fields.get()) {
    //         if ("main" == field) {
    //             methodMain = field;
    //         }
    //     }

    //     methodMain.expr = function():Null<TypedExpr>
    //     {
    //         return null;
    //     };
    //     for (t in types) {
    //         switch(t) {
    //             case TInst(c, _): {
    //                 for (meta in c.get().meta.get()) {
    //                     if (meta.name == ":expose") {

    //                     }
    //                 }
    //             }
    //             default:
    //         }
    //     }
    // }
}
#end