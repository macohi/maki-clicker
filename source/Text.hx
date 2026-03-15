import flixel.math.FlxPoint;
import flixel.text.FlxBitmapFont;
import flixel.text.FlxBitmapText;

// base code yoinked from here: https://github.com/VirtuGuy/WTF-Engine/blob/main/source/funkin/graphics/FunkinText.hx
class Text extends FlxBitmapText
{
	static final LETTERS:String = 'abcdefghijklmnopqrstuvwxyz1234567890.:';
	
	public var BASE_SIZE:Int = 8;
	public var size(default, set):Int = 8;

	override public function new(t:String, ?x:Float, ?y:Float, ?s:Null<Int>, ?f:String)
	{
		var font_size:Config = new Config('fonts/${f ?? 'normal'}');
		var font_size_point = FlxPoint.get(Std.parseInt(font_size.getData('width')), Std.parseInt(font_size.getData('height')));

		super(x, y, text, FlxBitmapFont.fromMonospace('assets/fonts/${f ?? 'normal'}.png', LETTERS, font_size_point));

		// letterSpacing = 0;
		// lineSpacing = 1;

		active = false;

		BASE_SIZE = Std.int(font_size_point.x);
		this.size = s ?? BASE_SIZE;
		text = t;
	}

	override function set_text(text:String):String
	{
		text = text?.toLowerCase();
		if (this.text == text)
			return text;
		return super.set_text(text);
	}

	function set_size(size:Int):Int
	{
		this.size = size;

		scale.x = size / BASE_SIZE;
		scale.y = scale.x;

		updateHitbox();

		return size;
	}
}
