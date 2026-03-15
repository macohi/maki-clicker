import flixel.FlxG;
import flixel.FlxState;

class InitState extends FlxState
{
	override function create()
	{
		super.create();

		trace('Maki Clicker ${Global.VERSION.makeString()}');

		Global.changeSAVESLOT('game1');

		#if web
		// pixel perfect render fix!
		lime.app.Application.current.window.element.style.setProperty("image-rendering", "pixelated");
		#end

		switchState();
	}

	public function switchState()
	{
		#if SHOP
		FlxG.switchState(() -> new ShopState());
		return;
		#end

		FlxG.switchState(() -> new PlayState());
	}
}
