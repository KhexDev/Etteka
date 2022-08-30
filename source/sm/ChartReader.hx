package sm;

import openfl.Assets;

using StringTools;

class ChartReader
{
	public static var dataNotes:Array<Note> = [];

	var readNote:Bool = false;

	public static function readSM(file:String)
	{
		var data:Array<String> = Assets.getText(file).split("\n");

		for (i in 0...data.length)
		{
			// trace(data[i]);

			if (data[i].startsWith("#BPMS"))
			{
				var arr = data[i].split(":");
				var bpms = arr[1].split("=");
				var daBpm = Std.parseFloat(bpms[1].replace(";", ""));
				trace(daBpm);
				Conductor.changeBPM(daBpm);
				trace('bpm is ${Conductor.bpm}');
			}

			if (data[i].startsWith("#NOTES"))
			{
				trace("start reading notes");

				var notes:Array<Section> = [];

				var section:Section = {
					sectionLength: 16,
					sectionNotes: []
				};

				for (j in i + 6...data.length)
				{
					// trace(data[j]);

					var columns = data[j].split("");
					trace(columns);

					if (columns.length > 3)
					{
						section.sectionNotes.push(columns);
					}
					else
					{
						notes.push(section);

						section = {
							sectionLength: 16,
							sectionNotes: []
						};
					}
				}

				// trace(notes);

				for (beat in 0...notes.length)
				{
					var section = notes[beat];

					// column
					for (j in 0...section.sectionNotes.length)
					{
						trace("section length is " + section.sectionNotes.length);

						var lengthInRow = 192 / (section.sectionNotes.length - 1);

						trace("length in row should be " + lengthInRow);

						// array notes
						for (k in 0...section.sectionNotes[j].length)
						{
							var noteType = section.sectionNotes[j][k];

							if (noteType == "1" || noteType == "2")
							{
								var noteData:Int = k;
								// trace(noteData);
								var strumTime:Float = (Conductor.crochet * 4 * beat) + ((beat - Conductor.crochet * 4 * beat) / Conductor.bpm);
								trace(strumTime * 1000);

								var daNote:Note = new Note(noteData, strumTime * 1000, 3);
								dataNotes.push(daNote);
							}
						}
					}
				}
			}

			if (data[i].startsWith(";"))
			{
				trace("finished reading notes");
			}
		}
	}

	public static function getNotes()
	{
		return dataNotes;
	}
}

typedef Section =
{
	var sectionNotes:Array<Array<String>>;
	var sectionLength:Int;
}
