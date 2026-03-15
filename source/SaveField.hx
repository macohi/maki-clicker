import flixel.FlxG;

class SaveField<T>
{
	public var name:String;

	public var field:String;

	public function new(field:String, initalValue:Null<T>, ?name:String)
	{
		this.field = field;
		this.name = name ?? field;

		#if !CLEAR_SAVE
		if (value == null)
		#end
		value = initalValue;
	}

	public var value(get, set):Null<T>;

	function get_value():Null<T>
	{
		if (!FlxG.save.isBound)
			return null;

		return Reflect.field(FlxG.save.data, field);
	}

	function set_value(value:Null<T>):Null<T>
	{
		if (!FlxG.save.isBound)
			return null;

		Reflect.setField(FlxG.save.data, field, value);
		return value;
	}
}
