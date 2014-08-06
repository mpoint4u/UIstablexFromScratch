package;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.Scene;
import openfl.Lib;

class MainScene extends Scene
{
	// defining class members	
	private var block:Entity;

	// constructor
	public function new() {
		super();
	}

	// methods
	public override function begin() {
		// add the png-image to the Entity
		block = addGraphic(new Image("assets/img/nme.png"));
	}

	public override function update() {
		
		if ( block.x < Lib.current.stage.stageWidth ) 
		{
			block.moveBy(2, 0);			
		} else {			
			block.x = 0;
			block.y += 50;
		}
		


		super.update();
	}
}