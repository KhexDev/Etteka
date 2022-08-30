package json;

typedef SwagSection =
{
	var startTime:Float;
	var endTime:Float;
	var sectionNotes:Array<Array<Dynamic>>;
	var lengthInSteps:Int;
	var typeOfSection:Int;
	var mustHitSection:Bool;
	var bpm:Float;
	var changeBPM:Bool;
	var altAnim:Bool;
	var CPUAltAnim:Bool;
	var playerAltAnim:Bool;
	var player1:String;
	var player2:String;
}

class Section
{
	public var startTime:Float;
	public var endTime:Float;
	public var sectionNotes:Array<Array<Dynamic>>;
	public var lengthInSteps:Int;
	public var typeOfSection:Int;
	public var mustHitSection:Bool;
	public var bpm:Float;
	public var changeBPM:Bool;
	public var altAnim:Bool;
	public var CPUAltAnim:Bool;
	public var playerAltAnim:Bool;
}
