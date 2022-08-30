package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxMath;
import flixel.math.FlxRandom;
import flixel.text.FlxText;
import flixel.util.FlxTimer;
import openfl.events.KeyboardEvent;
import sm.ChartConverter.ChartConvert;
import sm.ChartReader;
import sys.FileSystem;

using StringTools;

class PlayState extends FlxState
{
	public static var songMultiplier:Float = 1;

	var receptors:FlxTypedGroup<Receptor>;
	var notes:FlxTypedGroup<Note>;

	var random:FlxRandom;

	var notePlayed:Int;
	var noteHit:Float;
	var accuracy:Float;

	var infoText:FlxText;

	var misses:Int;

	var bg:FlxSprite;

	public static var songName:String;

	override public function create()
	{
		random = new FlxRandom();
		FlxG.fixedTimestep = false;

		// make background image sprite
		bg = new FlxSprite().loadGraphic("assets/songs/me & u (Wiosna)/bg.jpg");
		bg.setGraphicSize(FlxG.width, FlxG.height);
		bg.updateHitbox();
		bg.screenCenter(XY);
		add(bg);

		receptors = new FlxTypedGroup<Receptor>();
		add(receptors);

		notes = new FlxTypedGroup<Note>();
		add(notes);

		generateReceptor();

		Conductor.changeBPM(200);
		trace(Conductor.crochet);

		// delay before song start
		Conductor.songPosition = -(Conductor.crochet * 5);

		generateNotes();

		infoText = new FlxText(0, 200, 0, "Accuracy: 100 %", 20);
		add(infoText);

		addEvents();

		super.create();
	}

	function addEvents()
	{
		FlxG.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
		FlxG.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyReleased);
	}

	function removeEvent()
	{
		FlxG.stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
		FlxG.stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyReleased);
	}

	function generateReceptor()
	{
		for (i in 0...4)
		{
			var receptor:Receptor = new Receptor();
			receptor.x = (FlxG.width / 2) - 250;
			receptor.x += (receptor.width * i);
			receptors.add(receptor);
		}
	}

	function generateNotes()
	{
		var path = 'assets/songs/$songName/';
		var smFile:String = null;

		// regarder si fichier qui fini en ".sm" dans "path"
		for (file in FileSystem.readDirectory(path))
		{
			if (file.endsWith(".sm"))
			{
				smFile = file;
			}
		}

		// creer une variable pour les chart
		var SONG = ChartConvert.smToJson(path + smFile);

		// cherche section dans "SONG.notes"
		for (section in SONG.notes)
		{
			// chercher notes dans "section.sectionNotes"
			for (dataNote in section.sectionNotes)
			{
				// ajoute une note
				var daNote:Note = new Note(dataNote[1], dataNote[0], 2.7);
				notes.add(daNote);
			}
		}
	}

	// keybinds
	var controls = ["C", "V", "B", "N"];

	// input
	function onKeyPress(event:KeyboardEvent)
	{
		// get key from keyCode
		var keyFromEvent = FlxKey.toStringMap.get(event.keyCode);

		// check every key that match keybind
		for (i in 0...4)
		{
			// if it match
			if (keyFromEvent.toUpperCase() == controls[i])
			{
				// la note a toucher
				var n:Note = null;

				for (daNote in notes.members)
				{
					// si on a deja eu la note à toucher
					if (n != null)
					{
						if (n.noteData == daNote.noteData)
						{
							// logique pour mini anti jack
							if (Math.abs(daNote.strumTime - n.strumTime) < 10)
							{
								daNote.kill();
								notes.remove(daNote, true);
								daNote.destroy();
							}
							else if (daNote.strumTime < n.strumTime)
							{
								n = daNote;
								break;
							}
						}
					}
					else
					{
						if (daNote.noteData == i && daNote.canBeHit)
						{
							n = daNote;
							break;
						}
					}
				}

				if (n != null)
				{
					goodNoteHit(n);
				}
				else
				{
					receptors.members[i].scale.set(0.9, 0.9);
				}
			}
		}
	}

	function onKeyReleased(event:KeyboardEvent)
	{
		var keyFromCode = FlxKey.toStringMap.get(event.keyCode);

		for (i in 0...4)
		{
			if (controls[i] == keyFromCode.toUpperCase())
			{
				receptors.members[i].scale.set(1, 1);
			}
		}
	}

	function getPoint(diff:Float):Float
	{
		if (diff < 25)
			return 1;
		else if (diff < 45)
			return 0.75;
		else if (diff < 90)
			return 0.5;
		return 0;
	}

	function goodNoteHit(daNote:Note)
	{
		trace("note hit");

		var diff = Conductor.songPosition - daNote.strumTime;

		trace(diff);

		var point:Float = 1;

		var absDiff = Math.abs(diff);

		point = getPoint(absDiff);

		noteHit += point;

		daNote.kill();
		notes.remove(daNote, true);
		daNote.destroy();

		updateInfo();
	}

	function updateInfo()
	{
		notePlayed++;

		accuracy = Math.max(0, noteHit / notePlayed * 100);

		remove(infoText);
		infoText.text = "Accuracy: " + accuracy + "%";
		infoText.text += "\nMisses: " + misses;
		add(infoText);
	}

	function noteMiss(daNote:Note)
	{
		trace("note missed");

		misses++;

		daNote.kill();
		notes.remove(daNote, true);
		daNote.destroy();

		updateInfo();
	}

	function resyncSong()
	{
		FlxG.sound.music.time = Conductor.songPosition;
	}

	override public function update(elapsed:Float)
	{
		if (Conductor.songPosition > 0)
		{
			if (FlxG.sound.music == null)
			{
				var path = 'assets/songs/$songName';
				var oggFile:String = "";

				for (file in FileSystem.readDirectory(path))
				{
					if (file.endsWith(".ogg"))
					{
						oggFile = file;
					}
				}

				FlxG.sound.playMusic(path + oggFile);
			}
		}

		Conductor.songPosition += FlxG.elapsed * 1000;

		var controls = [
			FlxG.keys.pressed.D,
			FlxG.keys.pressed.F,
			FlxG.keys.pressed.J,
			FlxG.keys.pressed.K
		];

		notes.forEachAlive(function(daNote:Note)
		{
			daNote.active = daNote.y <= FlxG.height;
			daNote.visible = daNote.y <= FlxG.height;

			daNote.x = receptors.members[daNote.noteData].x;

			daNote.y = (receptors.members[daNote.noteData].y - (Conductor.songPosition - daNote.strumTime)) * (0.45 * daNote.speed);

			if (daNote.y <= -daNote.height && !daNote.canBeHit)
			{
				noteMiss(daNote);
			}
		});

		if (FlxG.keys.justPressed.ONE)
		{
			removeEvent();

			FlxG.switchState(new PlayState());
		}

		if (FlxG.sound.music != null)
		{
			if (FlxG.sound.music.time >= Conductor.songPosition + 20 || FlxG.sound.music.time <= Conductor.songPosition - 20)
			{
				resyncSong();
			}

			if (Conductor.songPosition >= FlxG.sound.music.endTime && notes.members.length == 0)
			{
				new FlxTimer().start(5, function(_)
				{
					removeEvent();
					FlxG.switchState(new SongState());
				});
			}
		}

		if (FlxG.keys.justPressed.ESCAPE)
		{
			removeEvent();

			FlxG.switchState(new SongState());
		}

		super.update(elapsed);
	}
}
