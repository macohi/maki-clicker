import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState
{
	public var theObject:TheObject = new TheObject();

	public var score:Int = 0;
	public var scoreText:Text = new Text('');

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

		scoreText.fieldWidth = FlxG.width;
		scoreText.alignment = CENTER;
        add(scoreText);

		add(new VersionText());
	}

	public function increment(amount:Int)
	{
		score += amount;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		scoreText.text = 'Score: $score';
        scoreText.y = FlxG.height - (scoreText.height * 1.5);
	}
}
