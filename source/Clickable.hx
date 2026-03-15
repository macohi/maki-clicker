import flixel.FlxG;
import flixel.util.FlxSignal;
import flixel.FlxSprite;

class Clickable extends FlxSprite
{
	override public function new(object:String)
	{
		super(0, 0, 'assets/clickables/$object.png');

		screenCenter();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.mouse.overlaps(this))
		{
			if (FlxG.mouse.justPressed)
				onLeftPressed.dispatch();

            
			if (FlxG.mouse.justReleased)
				onLeftReleased.dispatch();
		}
	}

	public var onLeftPressed:FlxSignal = new FlxSignal();
	public var onLeftReleased:FlxSignal = new FlxSignal();
}
