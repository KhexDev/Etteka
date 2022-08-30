package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

using StringTools;

#if sys
import sys.FileSystem;
#end

class SongState extends FlxState
{
	var songs:Array<String> = [];
	var selection:Int;

	var songName:FlxText;

	override public function create()
	{
		getSongs();

		songName = new FlxText(0, 0, 0, songs[selection], 24);
		songName.screenCenter(XY);
		songName.visible = false;
		add(songName);

		getAudioSample(songs[selection]);
		updateUI();

		super.create();
	}

	function updateUI()
	{
		songName.visible = true;

		remove(songName);
		songName.text = songs[selection];
		songName.screenCenter(XY);
		add(songName);
	}

	function getAudioSample(song:String)
	{
		var path = 'assets/songs/${song}/';

		for (file in FileSystem.readDirectory(path))
		{
			if (file.endsWith(".ogg"))
			{
				FlxG.sound.playMusic(path + file);
			}
		}
	}

	function getSongs()
	{
		for (song in FileSystem.readDirectory("assets/songs/"))
		{
			songs.push(song);
		}

		trace(songs);
	}

	function changeSong(change:Int)
	{
		selection = change;

		if (selection > songs.length - 1)
		{
			selection = 0;
		}
		else if (selection < 0)
		{
			selection = songs.length - 1;
		}

		trace(selection);

		getAudioSample(songs[selection]);

		updateUI();
	}

	function selectSong()
	{
		FlxG.switchState(new PlayState());

		PlayState.songName = songs[selection];
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.LEFT)
			changeSong(selection - 1);
		if (FlxG.keys.justPressed.RIGHT)
			changeSong(selection + 1);

		if (FlxG.keys.justPressed.ENTER)
		{
			selectSong();
		}

		super.update(elapsed);
	}
}
