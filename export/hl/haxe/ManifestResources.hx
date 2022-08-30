package;


import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		Assets.libraryPaths["default"] = rootPath + "manifest/default.json";
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images__down_go_receptor_go_2x1__doubleres__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images__down_tap_note_1x8__doubleres__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images__up_tap_note_1x8__doubleres__png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_aoao_08_aoao_royal_mix__mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_aoao_08_aoao_royal_mix__ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_aoao_aoao_bn_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_aoao_aoao_dwi extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_aoao_aoao_dwi_old extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_aoao_aoao_sm extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_aoao_aoao_sm_old extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_aoao_aoaobg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_aoao_cdtitle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_blastix_riotz__hi19hi19___cdtitle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_blastix_riotz__hi19hi19__blastix_riotz_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_blastix_riotz__hi19hi19__blastix_riotz_bn_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_blastix_riotz__hi19hi19__blastix_riotz_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_blastix_riotz__hi19hi19__blastix_riotz_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_blastix_riotz__hi19hi19__blastix_riotz_sm extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_death_death_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_death_death_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_death_death_sm extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_final_draft_changed_bn_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_final_draft_final_draft_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_final_draft_final_draft_sm extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_go_beat_crazy_initial_d_go_beat_crazy_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_go_beat_crazy_initial_d_go_beat_crazy_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_go_beat_crazy_initial_d_go_beat_crazy_sm extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_go_beat_crazy_oip_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_goin__under_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_goin__under_bn_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_goin__under_goin__under_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_goin__under_goin__under_sm extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_goin__under_goin__under_sm_old extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_goin__under_goin__under_ssc extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_mad_scientist_changed_bn_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_mad_scientist_mad_scientist_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_mad_scientist_mad_scientist_sm extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_me___u__wiosna__audio_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_me___u__wiosna__audio_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_me___u__wiosna__bg_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_me___u__wiosna__bn_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_me___u__wiosna__cdtitle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_me___u__wiosna__siccducc___me_and_you_sm extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_me___u__wiosna__siccducc___me_and_you_sm_old extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_revolution_revolution_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_revolution_revolution_sm extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_revolution_revolution_sm_old extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_revolution_tree_bn_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_shotgun_senorita__zardonic_remix___dump___hi19hi19___cdtitle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_shotgun_senorita__zardonic_remix___dump___hi19hi19__shotgun_senorita__zardonic_remix__bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_shotgun_senorita__zardonic_remix___dump___hi19hi19__shotgun_senorita__zardonic_remix__bn_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_shotgun_senorita__zardonic_remix___dump___hi19hi19__shotgun_senorita__zardonic_remix__mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_shotgun_senorita__zardonic_remix___dump___hi19hi19__shotgun_senorita__zardonic_remix__ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_shotgun_senorita__zardonic_remix___dump___hi19hi19__shotgun_senorita__zardonic_remix__sm extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_super_mario_bros____main_theme__hi19hi19___cdtitle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_super_mario_bros____main_theme__hi19hi19__super_mario_bros____main_theme_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_super_mario_bros____main_theme__hi19hi19__super_mario_bros____main_theme_bn_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_super_mario_bros____main_theme__hi19hi19__super_mario_bros____main_theme_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_super_mario_bros____main_theme__hi19hi19__super_mario_bros____main_theme_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_super_mario_bros____main_theme__hi19hi19__super_mario_bros____main_theme_sm extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/fonts/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/fonts/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
