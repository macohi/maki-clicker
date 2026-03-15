import flixel.FlxG;
import flixel.util.FlxSignal;
import flixel.FlxSprite;

class TheObject extends FlxSprite
{
	override public function new()
	{
		super(0, 0, 'assets/object.png');

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
