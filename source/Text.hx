import flixel.text.FlxText;

class Text extends FlxText
{
	override public function new(t:String, ?x:Float, ?y:Float, ?s:Null<Int>)
	{
		super(x, y, 0, t, (s ?? 16));

		font = 'assets/born2bsportyfs.otf';
	}
}
