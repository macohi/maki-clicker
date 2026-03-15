import flixel.graphics.frames.FlxAtlasFrames;

class AnimatedClickable extends Clickable
{
	override public function new(object:String)
	{
		super(null);

        final basePath = 'assets/clickables/$object';
        
        frames = FlxAtlasFrames.fromSparrow('$basePath.png', '$basePath.xml');
        animation.addByPrefix('animation', 'animation', 24);
        animation.play('animation');
	}
}
