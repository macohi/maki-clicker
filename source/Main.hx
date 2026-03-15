import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	override public function new()
	{
        super();

		addChild(new FlxGame(0, 0, InitState));
	}
}
