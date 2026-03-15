class VersionText extends Text
{
	override public function new(?x:Float, ?y:Float, ?s:Null<Int>)
	{
		super(Global.VERSION.makeString(), x, y, s);
	}
}
