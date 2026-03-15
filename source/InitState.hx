import flixel.FlxG;
import flixel.FlxState;

class InitState extends FlxState
{
	override function create()
	{
		super.create();

		trace('Maki Clicker ${Global.VERSION.makeString()}');

		Global.changeSAVESLOT('game1');

		FlxG.switchState(() -> new PlayState());
	}
}
