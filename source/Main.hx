package;

import flixel.FlxGame;
import flixel.util.FlxColor;
import openfl.display.FPS;
import openfl.display.Sprite;

class Main extends Sprite
{
	var fps:FPS;

	var framesRate:Int = 995;

	// init game
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, SongState, 1, framesRate, framesRate));
		addChild(new FPS(10, 10, FlxColor.WHITE));
	}
}
