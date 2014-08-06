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
	
    /**
    * Enrty point
    *
    */
    static public function main () : Void {
		
        UIBuilder.regClass('ColorWidget');
        UIBuilder.init();
		
		Lib.current.stage.align = StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;
		Lib.current.addChild(new MainStablexHXP());		

        //Create our UI
        //Lib.current.addChild( UIBuilder.buildFn('main.xml')() );
		
    }//end function main()	
	
	
}// end of class MainStablexHXP