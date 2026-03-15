import haxe.Json;
import lime.utils.Assets;

using StringTools;

class Config
{
	public var path:String = '';

	public function new(config:String)
		setConfig(config);

	public function setConfig(config:String)
	{
		if (config != null)
			this.path = 'assets/configs/$config.config';
	}

	public var fileLines(get, never):Array<String>;

	function get_fileLines():Array<String>
	{
		var fl = [];

		for (thing in Assets.getText(path).split('\n'))
		{
			if (thing.trim().length > 0)
				fl.push(thing.trim());
		}

		return fl;
	}

	public function getData(field:String):String
	{
		for (line in fileLines)
			if (line.startsWith('$field:'))
				return line.substr('$field:'.length).trim();

		return null;
	}

	public function getString(field:String):String
		return getData(field);

	public function getFloat(field:String):Null<Float>
		return Std.parseFloat(getString(field));

	public function getInt(field:String):Null<Int>
		return Std.parseInt(getString(field));

	public function getJSON(field:String):Null<Dynamic>
	{
		try
		{
			return Json.parse(getString(field));
		}
		catch (e)
		{
			trace('Config($path) getJSON error: $e');
			return null;
		}
	}

	public function getBool(field:String):Bool
		return getString(field).toLowerCase() == 'true';
}
