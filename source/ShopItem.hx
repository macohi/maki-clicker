import flixel.FlxSprite;

class ShopItem extends FlxSprite
{
	public var config:ShopItemConfigFile;

	public var useAmount:Int = 0;
	public var levelNumber:Int = 1;

	public function new(item:String, ?levelNumber:Int = 1, useAmount:Int = 0)
	{
		super(0, 0);

        changeItem(item, levelNumber, useAmount);
	}

    public function changeItem(item:String, ?levelNumber:Int = 1, ?useAmount:Int = 0)
    {
		if (item == null) return;

        loadGraphic('assets/shop/si-$item.png');
		screenCenter();
		
		config = new ShopItemConfigFile(item);

		levelNumber = levelNumber ?? 1;
		useAmount = useAmount ?? 0;
    }
}
