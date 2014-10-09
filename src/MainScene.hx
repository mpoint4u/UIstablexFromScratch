package ;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.Scene;
import openfl.Lib;
import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.Widget;

class MainScene extends Scene
{
	// defining class members	
	private var ent1:Entity;
	private var ent2:Entity;
	private var mywidget:Widget;
	
	// constructor
	public function new() {
		super();
	}

	// methods
	public override function begin() {
															trace("overridden function begin() was called ... ");	
		
		// add the png-images to the Entities
		ent1 = addGraphic(new Image("assets/img/block.png"), 1);   // HXP layer 1 is over HXP Layer 2 , and they 
																   // are ALL on OpenFL layer 0 (--> openfl.display.DisplayObject)... !! 
		ent2 = addGraphic(new Image("assets/img/nme.png"),   2);
			
		_createMainWidget();
	}

	
	public override function update() {
		//trace("function update() was called ... ");

		controlEnt1();
		controlEnt2();
		
		super.update();
	}
	
	public override function end() {
		// put stuff in here that need to be done, when ending this scene ... 
		trace("MainScene has ended ... ");
	}
	
	private function _createMainWidget():Void 
	{
		// create the main widget
		mywidget = UIBuilder.buildFn('ui/index.xml')();
		
		// give an offset on the main widget IF NEEDED !! ... 
		mywidget.left = 0;
		mywidget.top = 0;
		Lib.current.stage.addChildAt(mywidget, 1);			// 1 for openfl.display.DisplayObject puts Widget over the entities	
	}
	
	function controlEnt1():Void {
		
		if ( ent1.x < Lib.current.stage.stageWidth ) 
		{
			ent1.moveBy(3, 0);			
		} else {			
			ent1.x = 0;
			ent1.y += 50;
		}
	}
	
	function controlEnt2():Void {
		
		if( ent2.y < Lib.current.stage.stageHeight ){
			  ent2.moveBy(0, 2);
		} else {
			ent2.y = 0;
			ent2.x += 30; 
		}
	}
}