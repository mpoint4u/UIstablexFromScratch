package ;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.Scene;
import openfl.Lib;
import ru.stablex.ui.UIBuilder;
import ru.stablex.ui.widgets.HBox;
import ru.stablex.ui.widgets.Widget;

class MainScene extends Scene
{
	// defining class members	
	private var block:Entity;
	//private var mywidget:HBox;
	private var mywidget:Widget;
	
	// constructor
	public function new() {
		super();
		//constructStablexUI();
	}

	// methods
	public override function begin() {
															trace(" overridden function begin() was called ... ");	
		
		// add the png-image to the Entity
		block = addGraphic(new Image("assets/img/nme.png"));
		
		// create the widget
		mywidget = UIBuilder.buildFn('ui/index.xml')();
															trace(Type.typeof(mywidget));	
		//Lib.current.addChild(mywidget);
		mywidget.left = 10;
		mywidget.top = 10;
		Lib.current.stage.addChildAt(mywidget, 0);
	}

	public override function update() {
		//trace(" overridden function update() was called ... ");

		if ( block.x < Lib.current.stage.stageWidth ) 
		{
			block.moveBy(2, 0);			
		} else {			
			block.x = 0;
			block.y += 50;
		}
		
/*		if ( mywidget.x < Lib.current.stage.stageWidth) 
		{
			mywidget.x += .5;			
		} else {
			mywidget.x = 0;
		}
		
		if ( mywidget.y < Lib.current.stage.stageHeight) 
		{
			mywidget.y += 1;			
		} else {
			mywidget.y = 0;
		}*/
		
		super.update();
	}		
}