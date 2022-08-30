import flixel.FlxSprite;

class Note extends FlxSprite
{
	public var canBeHit:Bool;

	public var noteData:Int;
	public var strumTime:Float;
	public var speed:Float;

	public function new(noteData:Int, strumTime:Float, speed:Float)
	{
		super();

		this.noteData = noteData;
		this.strumTime = strumTime;
		this.speed = speed;

		loadGraphic("assets/images/_down tap note 1x8 (doubleres).png", true, 128, 128);
		animation.add("static", [0]);
		animation.play("static");
	}

	override public function update(elapsed:Float)
	{
		canBeHit = (strumTime - Conductor.songPosition <= (((166 * Conductor.timeScale) / (PlayState.songMultiplier < 1 ? PlayState.songMultiplier : 1)))
			&& strumTime - Conductor.songPosition >= (((-166 * Conductor.timeScale) / (PlayState.songMultiplier < 1 ? PlayState.songMultiplier : 1))));

		super.update(elapsed);
	}
}
