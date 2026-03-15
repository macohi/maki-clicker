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
			if (FlxG.mouse.justReleased)
				onLeftClick.dispatch();
			else if (FlxG.mouse.justReleasedRight)
				onLeftClick.dispatch();
	}

	public var onLeftClick:FlxSignal = new FlxSignal();
	public var onRightClick:FlxSignal = new FlxSignal();
}
