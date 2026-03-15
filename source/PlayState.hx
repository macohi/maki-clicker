import flixel.FlxState;

class PlayState extends FlxState
{
	public var theObject:TheObject = new TheObject();

	public var score:Int = 0;
    

	override function create()
	{
		super.create();

		add(theObject);

		theObject.onLeftPressed.add(function()
		{
			increment(1);
            theObject.scale.set(0.8, 0.8);
		});
		theObject.onLeftReleased.add(function()
		{
            theObject.scale.set(1, 1);
		});

        add(new VersionText());
	}

	public function increment(amount:Int)
	{
		score += amount;
	}
}
