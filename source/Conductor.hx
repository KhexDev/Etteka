class Conductor
{
	public static var bpm:Float;
	public static var crochet:Float = (bpm / 60) * 1000;
	public static var stepCrochet:Float = crochet / 4;
	public static var songPosition:Float = 0;
	public static var safeFrames:Int = 10;
	public static var safeZoneOffset:Float = Math.floor((safeFrames / 60) * 1000);
	public static var timeScale:Float = Conductor.safeZoneOffset / 166;
	public static var offsets:Float = 0;

	public static function changeBPM(newBPM:Float)
	{
		bpm = newBPM;
		crochet = (bpm / 60);
		stepCrochet = crochet / 4;
	}
}
