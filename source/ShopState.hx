import lime.utils.Assets;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

using StringTools;

class ShopState extends FlxState
{
	public var table:FlxSprite;

	public var shopKeeper:FlxSprite;

	public var pointsText:Text = new Text('');

	public var itemSpr:ShopItem;
	public var itemText:Text = new Text('');

	public var itemList:Array<String> = [];

	override function create()
	{
		super.create();

		for (item in Assets.getText('assets/shop/items.txt').split('\n'))
			if (item.trim().length > 0)
				itemList.push(item.trim());

		shopKeeper = new FlxSprite(0, 0);
		shopkeeperState();
		add(shopKeeper);

		table = new FlxSprite(0, 0, 'assets/shop/table.png');
		add(table);

		itemSpr = new ShopItem(null);
		add(itemSpr);

		add(itemText);

		pointsText.setPosition(10, 10);
		add(pointsText);

		changeItem(itemList[0]);
	}

	public function shopkeeperState(state:String = 'idle')
	{
		shopKeeper.loadGraphic('assets/shop/sp-$state.png');
		shopKeeper.screenCenter();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		table.setPosition(shopKeeper.x, shopKeeper.y);

		itemText.setPosition(table.getGraphicMidpoint().x * 0.825, table.getGraphicMidpoint().y * 1.225);

		pointsText.text = 'Points: ${Global.POINTS.value}';

		if (FlxG.keys.justReleased.ESCAPE)
			FlxG.switchState(() -> new PlayState());
	}

	public function changeItem(item:String)
	{
		if (!Global.SHOP_ITEMS_WITH_LEVELS.value.exists(item))
		{
			Global.SHOP_ITEMS_WITH_LEVELS.value.set(item, 1);
			Global.SHOP_ITEMS_WITH_USES.value.set(item, 0);
		}

		this.itemSpr.changeItem(item, Global.SHOP_ITEMS_WITH_LEVELS.value.get(item), Global.SHOP_ITEMS_WITH_USES.value.get(item));
		itemText.text = 'Level: ${itemSpr.levelNumber}\n' + 'Price: ${itemSpr.config.cost} points\n\n' + '${itemSpr.config.description}';
	}
}
