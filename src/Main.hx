package ;

import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;
import ru.stablex.ui.UIBuilder;

/**
 * ...
 * @author pm
 */

class Main extends Sprite 
{
	var inited:Bool;

	/* ENTRY POINT */
	
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
	}
	
	function init() 
	{
		trace("init() function is called...");
		
		if (inited) return;			// just to make sure that init() isn't called twice ... 
		inited = true;

		// (your code here)
		
		UIBuilder.init();
		trace("UIBuilder.init() is called...");
/*		
 *		Stage:
 *      stage.stageWidth x stage.stageHeight @ stage.dpiScale
 *      
 *      Assets:
 *      nme.Assets.getBitmapData("img/assetname.jpg");
 */
		
		
	}

	/* SETUP */

	public function new() 
	{
		trace("constructor new() is called...");
		super();	
		addEventListener(Event.ADDED_TO_STAGE, added);
	}

	function added(e) 
	{
		trace("added() function is called...");
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else
		init();
		#end
	}
	
	public static function main() 
	{
		trace("public static function main()  is called...");
		// static entry point
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
	}
}
