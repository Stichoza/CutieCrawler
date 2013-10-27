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
		
		public function Main():void {
			stage.scaleMode = StageScaleMode.SHOW_ALL;
			stage.align = StageAlign.BOTTOM;
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
			cMatrix = new CutieManager(stage.stageWidth, stage.stageHeight);
			var stageRect:Sprite = new Sprite();
			stageRect.graphics.lineStyle(1, 0x00FF00);
			stageRect.graphics.beginFill(0xFF00FF);
			stageRect.graphics.drawRect(1, 1, stage.stageWidth - 2, stage.stageHeight - 2);
			addChild(stageRect);
			stageRect.x = stageRect.y = 0;
			// cutie tests
			var w1:AbstractCutem = new AbstractCutem("ManualCutie");
			addChild(w1);
			w1.locate(0, 1, 0);
			
			cMatrix.newCutie("CutieFromCode", 1, 2, 0);
		
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