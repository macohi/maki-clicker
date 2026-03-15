import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
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
		magon.updateHitbox();

		add(numbersText);
		add(new VersionText());

		score = Global.SCORE.value;
		points = Global.POINTS.value;

		new FlxTimer().start(FlxG.random.float(2, 5), function(t)
		{
			// trace(t.elapsedLoops);
			if (t.elapsedLoops == 1)
			{
				t.time -= FlxG.random.float(-1, 3);
			}
			else if (FlxG.random.bool(FlxG.random.float(0, 25)))
			{
				var inc:Float = FlxG.random.float(-0.1, 10);

				if (t.time + inc > 10)
					t.time = 10;
				else
					t.time += inc;
			}
			else
			{
				trace('New poive after ${t.time}');

				var newPoive:Poive = new Poive();
				newPoive.randomPosition(magon);
				poives.add(newPoive);

				newPoive.onLeftReleased.add(function()
				{
					incrementPoints(newPoive.config.reward);

					FlxTween.cancelTweensOf(newPoive);
					poives.remove(newPoive);
					newPoive.destroy();
				});

				FlxTween.tween(newPoive, {alpha: 0}, 2, {
					ease: FlxEase.sineInOut,
					startDelay: 1,
					onComplete: function(t)
					{
						poives.remove(newPoive);
						newPoive.destroy();
					}
				});
			}
		}, 0);
	}

	public function incrementScore(amount:Int)
	{
		score += amount;
	}

	public var pointAdditionText:Text;
	public var pointQueue:Int = 0;

	public function incrementPoints(amount:Int)
	{
		pointQueue += amount;

		if (pointAdditionText == null)
		{
			pointAdditionText = new Text('', 0, 0);
			add(pointAdditionText);
			pointAdditionText.color = FlxColor.LIME;
		}

		FlxTween.cancelTweensOf(pointAdditionText);

		pointAdditionText.alpha = 1;
		pointAdditionText.y = FlxG.height - (pointAdditionText.height * 3);

		function updatePAT(percent:Float = 1)
		{
			pointAdditionText.text = '+${Math.floor(FlxMath.lerp(pointQueue, 0, 1 - percent))} Points';
			pointAdditionText.screenCenter(X);
		}

		updatePAT(1);
		FlxTween.tween(pointAdditionText, {y: FlxG.height - (numbersText.height * 1.5), alpha: 0}, 0.5, {
			ease: FlxEase.sineInOut,
			startDelay: 1,
			onComplete: function(t)
			{
				points += pointQueue;
				pointQueue = 0;
			},
			onUpdate: function(t)
			{
				updatePAT(1 - t.percent);
			}
		});
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
