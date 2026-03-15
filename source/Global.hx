import lime.app.Application;
import flixel.FlxG;

class Global
{
	public static final VERSION:Version = new Version();

	public static var SCORE:SaveField<Int>;
	public static var POINTS:SaveField<Int>;

	public static var SAVE_SLOT:String = 'game1';

	public static function changeSAVESLOT(nss:String)
	{
		SAVE_SLOT = nss;

		if (!FlxG.save.isBound)
			Application.current.onExit.add(function(i)
			{
				SCORE.value = SCORE.value;
				POINTS.value = POINTS.value;

				FlxG.save.flush();
			});

		FlxG.save.bind(SAVE_SLOT, Application.current.meta.get('company') + '/maki-clicker');

		if (FlxG.save.data == null)
		{
			FlxG.save.erase();
			changeSAVESLOT(nss);

			return;
		}

		trace('Save slot $nss');

		SCORE = new SaveField<Int>('score', 0, 'Score');
		POINTS = new SaveField<Int>('points', 0, 'Points');

		trace(FlxG.save.data);
	}
}
