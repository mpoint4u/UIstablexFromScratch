package ;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import ru.stablex.ui.UIBuilder;

/**
 * ...
 * @author pm
 */

class Main extends Sprite 
{
	var inited:Bool;
	
	/* CONSTRUCTOR */	
	public function new() 
	{
		//trace("constructor new() is called...");
		super();	
		addEventListener(Event.ADDED_TO_STAGE, added);
	}	
	
	
	function constructMainUI():Void 
	{
		//flash.Lib.current.addChild( UIBuilder.buildFn('first.xml')() );
		
		// we need to use the full path here for iOS to build successfully !!... 
		// (so it's a good idea to use the same path on windows and macOSX...))
		flash.Lib.current.addChild( 
									UIBuilder.buildFn(
	//					'ui/first.xml'
	//					'ui/second.xml'
	//				'ui/third.xml'
	//				'ui/4th.xml'
					'ui/5th.xml'
				
													)() );
		
		trace("adding new widget as child to stage...");
	}	

	
	/************** SETUP FUNCTIONS ***************/
	
	function init() 
	{
		//trace(" init() function is called...");
		
		if (inited) return;			// just to make sure that init() isn't called twice ... 
		inited = true;

		// ******** ALL KIND OF CUSTOM INITIALIZATION STUFF ********** 
		// ( stablexui, etc..)
		
        //Register our custom widget, so we can use it in xml
        UIBuilder.regClass('ColorWidget');		
		trace("regClass('ColorWidget'...");
		
		
		UIBuilder.init();
		trace("initializing Stablex UI Builder ...");		
		
		constructMainUI();
	}

	function resize(e) 
	{
/*			if (!inited) init();
			else (resize or orientation change)*/
			
			if (!inited) 
			{
				init();
			} else 
			{
				// resize or orientation change			
			}
	}

	function added(e) 
	{
		//trace("added() function is called...");
		
		// change the Event listeners
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		
		// call init()
		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else

		init();
		#end
	}
	
	/* ENTRY POINT */
	public static function main() 
	{
		//trace("public static function main()  is called...");
		// static entry point
		Lib.current.stage.align = StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
	}
}
