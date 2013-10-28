package com.stichoza.cutiecrawler {
	import com.stichoza.cutiecrawler.cuteplanet.AbstractCutem;
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	/**
	 * ...
	 * @author Stichoza
	 */
	public class Main extends Sprite {
		
		protected var cMatrix:CutieManager;
		protected var bgLayer:BackgroundLayer;
		
		public function Main():void {
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.BOTTOM_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			if (stage) {
				init();
			} else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			cMatrix = new CutieManager(stage);
			bgLayer = new BackgroundLayer();
			addChild(bgLayer);
			
			for (var x:int = cMatrix.maxBlocksX - 1; x >= 0; x--) {
				for (var y:int = cMatrix.maxBlocksY - 1; y >= 0; y--) {
					//cMatrix.newCutie("flooring", x, y, 0);
				}
			}
			
			cMatrix.newCutie("test", 2, 3, 0);
			
			/*cMatrix.newCutie("CutieFromCode", 1, 3, 0);
			cMatrix.newCutie("CutieFromCode", 0, 1, 0);
			cMatrix.newCutie("CutieFromCode", 0, 0, 0);
			//cMatrix.newCutie("CutieFromCode", cMatrix.maxBlocksX, cMatrix.maxBlocksY, 0);
			cMatrix.newCutie("CutieFromCode", 2, 2, 0);
			cMatrix.newCutie("CutieFromCode", 2, 2, 1);
			cMatrix.newCutie("CutieFromCode", 2, 2, 2);
			cMatrix.newCutie("CutieFromCode", 3, 2);
			cMatrix.newCutie("CutieFromCode", 3, 2);*/
		
		/*var w2:AbstractCutem = new AbstractCutem("aa");
		   addChild(w2);
		   w2.locate(3, 3, 0);
		   var w3:AbstractCutem = new AbstractCutem("aa");
		   addChild(w3);
		   w3.locate(2, 2, 0);
		   var w4:AbstractCutem = new AbstractCutem("aa");
		   addChild(w4);
		   w4.locate(3, 2, 0);
		   var w5:AbstractCutem = new AbstractCutem("aa");
		   addChild(w5);
		   w5.locate(0, 1, 1);
		   var w6:AbstractCutem = new AbstractCutem("aa");
		   addChild(w6);
		 w6.locate(3, 2, 1);*/
		}
		
		private function deactivate(e:Event):void {
			//NativeApplication.nativeApplication.exit(); // exit on minimize
			// TODO: do not exit, just pause game
		}
	
	}

}