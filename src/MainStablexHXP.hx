package ;

import com.haxepunk.Engine;
import com.haxepunk.HXP;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.Lib;
import ru.stablex.ui.UIBuilder;
//import com.haxepunk.RenderMode;

/**
 * ...
 * @author pm
 */
class MainStablexHXP extends Engine
{

/*	public function new(width:Int=0, height:Int=0, frameRate:Float=60, fixed:Bool=false, ?renderMode:RenderMode) 
	{
		super(width, height, frameRate, fixed, ?renderMode);
		
	}*/

	override public function init()
	{
#if debug
		HXP.console.enable();
#end
		HXP.scene = new MainScene();
	}
	
	public function constructStablexUI() {
		
		// ******** ALL KIND OF CUSTOM INITIALIZATION STUFF ********** 
		// ( stablexui, etc..)

		//register main class to access it's methods and properties in xml
		//UIBuilder.regClass('Main');
		
        //Register our custom widget, so we can use it in xml
        UIBuilder.regClass('ColorWidget');		
		trace("regClass('ColorWidget'...");		
	
		//initialize StablexUI
		//UIBuilder.init('ui/android/defaults.xml');
		UIBuilder.init();
		trace("initializing Stablex UI Builder ...");
		
		//register skins
		//UIBuilder.regSkins('ui/android/skins.xml');
	
		//create callback for alert popup
		//Main.alert = UIBuilder.buildFn('ui/alert.xml');
	
		//Create our UI
		var ui = UIBuilder.buildFn('ui/index.xml')();
		//ui.show();
		
		//Lib.current.addChild(ui);
		Lib.current.stage.addChild(ui);
		//addChild(ui);
	}	
	
    /**
    * Enrty point
    *
    */
    static public function main () : Void {
		
		Lib.current.stage.align = StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;
		//Lib.current.addChild(new MainStablexHXP());
		new MainStablexHXP();
	
		
    }//end function main()	
	
	
}// end of class MainStablexHXP