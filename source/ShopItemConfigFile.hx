class ShopItemConfigFile extends Config
{
	public var description(get, never):String;

	function get_description():String
		return getString('description');

	public var has_upgrade(get, never):Bool;

	function get_has_upgrade():Bool
		return getBool('has_upgrade') ?? false;

	public var uses(get, never):Int;

	function get_uses():Int
		return getInt('uses') ?? 1;

	public var cost(get, never):Int;

	function get_cost():Int
		return getInt('cost') ?? 1;

	public var method(get, never):ConfigMethod;

	function get_method():ConfigMethod
		return getJSON('method') ?? null;

	public var item:String = null;

	override public function new(item:String, startingLevel:Int = 1)
	{
		super(null);

		this.item = item;
		changeLevel(startingLevel);
	}

	public function changeLevel(level:Int)
		setConfig('shop/si-$item-$level');
}
