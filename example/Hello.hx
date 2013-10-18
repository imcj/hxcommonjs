package ;

@:expose(Hello)
class Hello
{
    public function new()
    {

    }

    public function say():String
    {
        return "hello";
    }

    static public function className():String
    {
        return "<Hello>";
    }
}