import flixel.FlxG;

class Poive extends AnimatedClickable
{
	public static final CONFIGS:Array<PoiveConfig> = [
		new PoiveConfig(0x386C4B, 25, null),
		new PoiveConfig(0xF7EF0E, 40, 30.0),
		new PoiveConfig(0x3E2645, 100, 25.0),
		new PoiveConfig(0xF407AD, 400, 2.0),
	];

	public var config:PoiveConfig;

	override public function new()
	{
		super('poive');

		for (config in CONFIGS)
		{
			if (config.chance == null)
				continue;
			if (this.config != null)
				continue;

			if (FlxG.random.bool(config.chance))
				this.config = config;
		}

		if (this.config == null)
			this.config = CONFIGS[0];

		this.color = this.config.color;

		this.scale.set(1 / 10, 1 / 10);
		updateHitbox();
	}

	public function randomPosition(magon:Clickable)
	{
		screenCenter();

		var iter:Int = 0;
		final offset = this.width / 4;

		while (this.overlaps(magon) && iter < 10)
		{
			x = FlxG.random.float(-offset, FlxG.width - this.width + offset);
			y = FlxG.random.float(-offset, FlxG.height - this.height - offset);

			iter++;
		}
	}
}
