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
	//private var mywidget:HBox;
	private var mywidget:Widget;
	//private var colorWid:ColorWidget;
	
	// constructor
	public function new() {
		super();
		//constructStablexUI();
	}

	// methods
	public override function begin() {
															trace(" overridden function begin() was called ... ");	
		
		// add the png-image to the Entity
		ent1 = addGraphic(new Image("assets/img/block.png"));		
		ent2  = addGraphic(new Image("assets/img/nme.png"));
			
		createMainWidget();
	}

	
	public override function update() {
		//trace(" overridden function update() was called ... ");

		controlEnt1();
		controlEnt2();
		
		super.update();
	}		
	
	function createMainWidget():Void 
	{
		// create the main widget
		mywidget = UIBuilder.buildFn('ui/index.xml')();	
		mywidget.left = 10;
		mywidget.top = 10;
		Lib.current.stage.addChildAt(mywidget, 1);			// 1 puts Widget over the entities	
	}
	
	function controlEnt1():Void 
	{
		if ( ent1.x < Lib.current.stage.stageWidth ) 
		{
			ent1.moveBy(3, 0);			
		} else {			
			ent1.x = 0;
			ent1.y += 50;
		}
	}
	
	function controlEnt2():Void 
	{
		if( ent2.y < Lib.current.stage.stageHeight ){
			  ent2.moveBy(0, 2);
		} else {
			ent2.y = 0;
			ent2.x += 30; 
		}
	}
}