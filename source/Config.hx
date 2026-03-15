import lime.utils.Assets;

using StringTools;

class Config
{
	public var path:String = '';

	public function new(config:String)
	{
		if (config != null)
			this.path = 'assets/configs/$config.config';
	}

	public var fileLines(get, never):Array<String>;

	function get_fileLines():Array<String>
	{
		return Assets.getText(path).split('\n');
	}

    public function getData(field:String):String
    {
        for (line in fileLines)
        {
            if (!line.startsWith('$field:')) continue;

            return line.substr('$field:'.length).trim();
        }

        return null;
    }
}
