package json;

import json.Section;

typedef SwagSong =
{
	var notes:Array<SwagSection>;
	var speed:Float;
	var song:String;
	var eventObjects:Array<Events>;
	var player1:String;
	var player2:String;
	var stage:String;
	var bpm:Float;
}

class Song
{
	var notes:Array<SwagSection>;
	var speed:Float;
	var song:String;
	var eventObjects:Array<Events>;
	var player1:String;
	var player2:String;
	var stage:String;
}

typedef Events =
{
	var name:String;
	var position:Float;
	var value:Float;
	var type:String;
}
