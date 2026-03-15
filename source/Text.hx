import flixel.math.FlxPoint;
import flixel.text.FlxBitmapFont;
import flixel.text.FlxBitmapText;

// base code yoinked from here: https://github.com/VirtuGuy/WTF-Engine/blob/main/source/funkin/graphics/FunkinText.hx

class Text extends FlxBitmapText
{
	static final LETTERS:String = 'abcdefghijklmnopqrstuvwxyz1234567890';
	static final FONT_SIZE:FlxPoint = new FlxPoint(32, 32);
	static final BASE_SIZE:Int = 8;

	public var size(default, set):Int = 8;

	override public function new(t:String, ?x:Float, ?y:Float, ?s:Null<Int>, ?f:String)
	{
		super(x, y, text, FlxBitmapFont.fromMonospace('assets/fonts/font-${f ?? 'normal'}.png', LETTERS, FONT_SIZE));

		letterSpacing = 1;
		lineSpacing = 2;

		active = false;

		this.size = s ?? BASE_SIZE;
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
