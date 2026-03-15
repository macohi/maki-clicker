import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class ShopState extends FlxState
{
	public var table:FlxSprite;

	public var shopKeeper:FlxSprite;

	public var numbersText:Text = new Text('');

	override function create()
	{
		super.create();

		shopKeeper = new FlxSprite(0, 0);
		shopkeeperState();
		add(shopKeeper);

		table = new FlxSprite(0, 0, 'assets/shop/table.png');
		add(table);

        numbersText.setPosition(10, 10);
		add(numbersText);
	}

	public function shopkeeperState(state:String = 'idle')
	{
		shopKeeper.loadGraphic('assets/shop/sp-$state.png');
		shopKeeper.screenCenter();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		table.setPosition(shopKeeper.x, shopKeeper.y);

		numbersText.text = 'Points: ${Global.POINTS.value}';

		if (FlxG.keys.justReleased.ESCAPE)
			FlxG.switchState(() -> new PlayState());
	}
}
