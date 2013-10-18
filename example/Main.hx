package ;

class Main extends hx.commonjs.Export
{
    static public var version(get_version, null):String;
    static public var com = {
        indvane: {
            Hello: Hello
        }
    };
    static public var named = 0;

    static function __init__() {
    }

    static function get_version():String
    {
        return "0.0.1";
    }

    static public function main()
    {
    }

    static public function __call__()
    {
        trace("call");
    }
}