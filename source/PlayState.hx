import flixel.FlxState;

class PlayState extends FlxState
{
	public var theObject:TheObject = new TheObject();

	public var score:Int = 0;

	override function create()
	{
		super.create();

		add(theObject);
		theObject.onLeftClick.add(function()
		{
			increment(1);
		});
	}

	public function increment(amount:Int)
	{
		score += amount;
	}
}
