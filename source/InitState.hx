import flixel.FlxG;
import flixel.FlxState;

class InitState extends FlxState
{
	override function create()
	{
		super.create();

		trace('Maki Clicker ${Global.VERSION.makeString()}');

		FlxG.switchState(() -> new PlayState());
	}
}
