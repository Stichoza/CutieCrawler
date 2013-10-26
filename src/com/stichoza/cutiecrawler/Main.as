package com.stichoza.cutiecrawler
{
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
	public class Main extends Sprite
	{
		
		
		
		public function Main():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.BOTTOM;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			var stageRect:Sprite = new Sprite();
			stageRect.graphics.lineStyle(1, 0x00FF00);
			stageRect.graphics.beginFill(0xFF00FF);
			stageRect.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			addChild(stageRect);
			trace(stage.stageWidth);
			// cu
			var w1:AbstractCutem = new AbstractCutem("aa");
			addChild(w1);
			w1.locate(2, 3, 4);
			trace(w1.height);
		}
		
		public function newCutie(name:String, x:int, y:int, z:int):Boolean {
			
		}
		
		private function deactivate(e:Event):void
		{
			//NativeApplication.nativeApplication.exit(); // exit on minimize
			// TODO: do not exit, just pause game
		}
	
	}

}