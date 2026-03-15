class Version extends Config
{
	public function makeString():String
	{
        final v:String = 'V$base';

		if (state.length > 0)
			return '$v $state';
		else
			return '$v';
	}

	public var base(get, never):String;

	function get_base():String
	{
		return getData('base');
	}

	public var state(get, never):String;

	function get_state():String
	{
		return getData('state');
	}

	override public function new()
	{
		super('version');
	}
}
