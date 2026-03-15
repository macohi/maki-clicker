import flixel.util.FlxTimer;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState
{
	public var magon:Clickable = new Clickable('magon');

	public var score:Int = 0;
	public var points:Int = 0;

	public var numbersText:Text = new Text('');

	public var poives:FlxTypedSpriteGroup<Poive>;

	override function create()
	{
		super.create();

		poives = new FlxTypedSpriteGroup<Poive>();
		add(poives);

		add(magon);

		magon.onLeftPressed.add(function()
		{
			incrementScore(1);
			magon.scale.set(0.8, 0.8);
		});
		magon.onLeftReleased.add(function()
		{
			magon.scale.set(0.9, 0.9);
		});
		magon.scale.set(0.9, 0.9);

		add(numbersText);
		add(new VersionText());

		score = Global.SCORE.value;

		new FlxTimer().start(10, function(t) {

			if (FlxG.random.bool(FlxG.random.float(0, 25)))
				t.time += FlxG.random.float(-0.1, 10);
			else
			{
				var newPoive:Poive = new Poive();
				newPoive.randomPosition(magon);
				poives.add(newPoive);
			}
		}, 0);
	}

	public function incrementScore(amount:Int)
	{
		score += amount;
	}

	public function incrementPoints(amount:Int)
	{
		points += amount;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		numbersText.text = 'Score: $score | Points: $points';
		numbersText.y = FlxG.height - (numbersText.height * 1.5);
		numbersText.screenCenter(X);

		Global.SCORE.value = score;
		Global.POINTS.value = points;
	}
}
