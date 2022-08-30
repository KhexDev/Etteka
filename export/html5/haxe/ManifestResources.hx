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

		data = '{"name":null,"assets":"aoy4:pathy34:assets%2Fdata%2Fdata-goes-here.txty4:sizezy4:typey4:TEXTy2:idR1y7:preloadtgoR0y36:assets%2Fimages%2Fimages-go-here.txtR2zR3R4R5R7R6tgoR0y72:assets%2Fimages%2F_Down%20Go%20Receptor%20Go%202x1%20%28doubleres%29.pngR2i5447R3y5:IMAGER5R8R6tgoR0y64:assets%2Fimages%2F_down%20tap%20note%201x8%20%28doubleres%29.pngR2i40959R3R9R5R10R6tgoR0y62:assets%2Fimages%2F_up%20tap%20note%201x8%20%28doubleres%29.pngR2i76023R3R9R5R11R6tgoR0y36:assets%2Fmusic%2Fmusic-goes-here.txtR2zR3R4R5R12R6tgoR0y51:assets%2Fsongs%2FMad%20Scientist%2FChanged%20bn.jpgR2i33983R3R9R5R13R6tgoR2i3979216R3y5:MUSICR5y52:assets%2Fsongs%2FMad%20Scientist%2Fmad-scientist.oggy9:pathGroupaR15hR6tgoR0y51:assets%2Fsongs%2FMad%20Scientist%2Fmad-scientist.smR2i12992R3R4R5R17R6tgoR2i4610652R3R14R5y56:assets%2Fsongs%2Fme%20%26%20u%20%28Wiosna%29%2Faudio.mp3R16aR18y56:assets%2Fsongs%2Fme%20%26%20u%20%28Wiosna%29%2Faudio.ogghR6tgoR2i10920059R3R14R5R19R16aR18R19hgoR0y53:assets%2Fsongs%2Fme%20%26%20u%20%28Wiosna%29%2Fbg.jpgR2i267996R3R9R5R20R6tgoR0y53:assets%2Fsongs%2Fme%20%26%20u%20%28Wiosna%29%2Fbn.pngR2i15054R3R9R5R21R6tgoR0y58:assets%2Fsongs%2Fme%20%26%20u%20%28Wiosna%29%2Fcdtitle.pngR2i4461R3R9R5R22R6tgoR0y79:assets%2Fsongs%2Fme%20%26%20u%20%28Wiosna%29%2Fsiccducc%20-%20me%20and%20you.smR2i13885R3R4R5R23R6tgoR0y83:assets%2Fsongs%2Fme%20%26%20u%20%28Wiosna%29%2Fsiccducc%20-%20me%20and%20you.sm.oldR2i13885R3R4R5R24R6tgoR0y36:assets%2Fsounds%2Fsounds-go-here.txtR2zR3R4R5R25R6tgoR2i2114R3R14R5y26:flixel%2Fsounds%2Fbeep.mp3R16aR26y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R14R5y28:flixel%2Fsounds%2Fflixel.mp3R16aR28y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i5794R3y5:SOUNDR5R27R16aR26R27hgoR2i33629R3R30R5R29R16aR28R29hgoR2i15744R3y4:FONTy9:classNamey35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R31R32y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R9R5R37R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R9R5R38R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

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
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/images/images-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/_Down Go Receptor Go 2x1 (doubleres).png") @:noCompletion #if display private #end class __ASSET__assets_images__down_go_receptor_go_2x1__doubleres__png extends lime.graphics.Image {}
@:keep @:image("assets/images/_down tap note 1x8 (doubleres).png") @:noCompletion #if display private #end class __ASSET__assets_images__down_tap_note_1x8__doubleres__png extends lime.graphics.Image {}
@:keep @:image("assets/images/_up tap note 1x8 (doubleres).png") @:noCompletion #if display private #end class __ASSET__assets_images__up_tap_note_1x8__doubleres__png extends lime.graphics.Image {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/songs/Mad Scientist/Changed bn.jpg") @:noCompletion #if display private #end class __ASSET__assets_songs_mad_scientist_changed_bn_jpg extends lime.graphics.Image {}
@:keep @:file("assets/songs/Mad Scientist/mad-scientist.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_mad_scientist_mad_scientist_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/Mad Scientist/mad-scientist.sm") @:noCompletion #if display private #end class __ASSET__assets_songs_mad_scientist_mad_scientist_sm extends haxe.io.Bytes {}
@:keep @:file("assets/songs/me & u (Wiosna)/audio.mp3") @:noCompletion #if display private #end class __ASSET__assets_songs_me___u__wiosna__audio_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/songs/me & u (Wiosna)/audio.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_me___u__wiosna__audio_ogg extends haxe.io.Bytes {}
@:keep @:image("assets/songs/me & u (Wiosna)/bg.jpg") @:noCompletion #if display private #end class __ASSET__assets_songs_me___u__wiosna__bg_jpg extends lime.graphics.Image {}
@:keep @:image("assets/songs/me & u (Wiosna)/bn.png") @:noCompletion #if display private #end class __ASSET__assets_songs_me___u__wiosna__bn_png extends lime.graphics.Image {}
@:keep @:image("assets/songs/me & u (Wiosna)/cdtitle.png") @:noCompletion #if display private #end class __ASSET__assets_songs_me___u__wiosna__cdtitle_png extends lime.graphics.Image {}
@:keep @:file("assets/songs/me & u (Wiosna)/siccducc - me and you.sm") @:noCompletion #if display private #end class __ASSET__assets_songs_me___u__wiosna__siccducc___me_and_you_sm extends haxe.io.Bytes {}
@:keep @:file("assets/songs/me & u (Wiosna)/siccducc - me and you.sm.old") @:noCompletion #if display private #end class __ASSET__assets_songs_me___u__wiosna__siccducc___me_and_you_sm_old extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


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
