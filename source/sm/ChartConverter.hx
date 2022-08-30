package sm;

import haxe.Json;
import json.Song;

class ChartConvert
{
	public static function smToJson(path:String)
	{
		var sm = SMFile.loadFile(path);
		var data = sm.convertToFNF("");

		var SONG:SwagSong = Json.parse(data);

		return SONG;
	}
}
