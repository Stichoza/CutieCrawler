package com.stichoza.cutiecrawler {
	import com.stichoza.ads.GoogleAdmob;
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
			var admob:GoogleAdmob = new GoogleAdmob();
			cMatrix = new CutieManager(stage);
			bgLayer = new BackgroundLayer();
			addChild(bgLayer);
			
			for (var x:int = 0; x < cMatrix.maxBlocksX; x++) {
				for (var y:int = 0; y < cMatrix.maxBlocksY; y++) {
					//cMatrix.newCutie("flooring", x, y, 0);
				}
			}
			
			cMatrix.newCutie("1-1-0", 0, 0);
			cMatrix.newCutie("1-1-1", 1, 3);
			cMatrix.newCutie("1-1-1", 1, 3);
			cMatrix.newCutie("1-1-1", 1, 3);
			
			cMatrix.sortLayers();
		
			//cMatrix.newCutie("CutieFromCode", cMatrix.maxBlocksX, cMatrix.maxBlocksY);
		
		}
		
		private function deactivate(e:Event):void {
			//NativeApplication.nativeApplication.exit(); // exit on minimize
			// TODO: do not exit, just pause game
		}
	
	}

}