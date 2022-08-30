import flixel.FlxSprite;

class Receptor extends FlxSprite
{
	public function new()
	{
		super();
		loadGraphic("assets/images/_Down Go Receptor Go 2x1 (doubleres).png", true, 128, 128);
		animation.add("static", [0], 1, false);
		animation.play("static");
	}
}
