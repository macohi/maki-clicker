import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState
{
	public var mainClickable:Clickable = new Clickable('main');

	public var score:Int = 0;
	public var scoreText:Text = new Text('');

	override function create()
	{
		super.create();

		add(mainClickable);

		mainClickable.onLeftPressed.add(function()
		{
			increment(1);
			mainClickable.scale.set(0.8, 0.8);
		});
		mainClickable.onLeftReleased.add(function()
		{
			mainClickable.scale.set(1, 1);
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
