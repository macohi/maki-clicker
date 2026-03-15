import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState
{
	public var magon:Clickable = new Clickable('magon');

	public var score:Int = 0;
	public var scoreText:Text = new Text('');

	override function create()
	{
		super.create();

		add(magon);

		magon.onLeftPressed.add(function()
		{
			increment(1);
			magon.scale.set(0.8, 0.8);
		});
		magon.onLeftReleased.add(function()
		{
			magon.scale.set(0.9, 0.9);
		});
		magon.scale.set(0.9, 0.9);

		add(scoreText);
		add(new VersionText());

		score = Global.SCORE.value;
	}

	public function increment(amount:Int)
	{
		score += amount;
		Global.SCORE.value = score;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		scoreText.text = 'Score: $score';
		scoreText.y = FlxG.height - (scoreText.height * 1.5);
		scoreText.screenCenter(X);
	}
}
