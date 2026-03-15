import flixel.util.FlxColor;

class PoiveConfig
{
	public var color:FlxColor;
	public var reward:Null<Int>;
	public var chance:Null<Float>;

	public function new(color:FlxColor, reward:Null<Int>, chance:Null<Float>)
	{
		this.color = color;
		this.reward = reward;
		this.chance = chance;
	}
}
