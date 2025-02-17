package com.stichoza.cutiecrawler 
{
	import flash.display.GradientType;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Matrix;
	/**
	 * ...
	 * @author Stichoza
	 */
	public class BackgroundLayer extends Sprite
	{
		private var bgRectingle:Sprite = new Sprite();
		private var bgMatrix:Matrix = new Matrix();
		private var gradRotation:Number = Math.PI / 2;
		private var colors:Array = [0x5080D9, 0xE5E9FF, 0x552000, 0x000000];
		private var alphas:Array = [1, 1, 0.8, 1];
		private var ratios:Array = [0, 127, 127, 255];
		
		public function BackgroundLayer() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// init
			this.bgMatrix.createGradientBox(stage.stageWidth + 200, stage.stageHeight + 200, this.gradRotation);
			this.bgRectingle.graphics.beginGradientFill(GradientType.LINEAR, this.colors, this.alphas, this.ratios, this.bgMatrix);
			this.bgRectingle.graphics.drawRect( -100, -100, stage.stageWidth + 200, stage.stageHeight + 200);
			addChild(this.bgRectingle);
		}
		
	}

}