package com.stichoza.cutiecrawler.cuteplanet
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.DisplayObject;
	
	/**
	 * ...
	 * @author Stichoza
	 */
	public class AbstractCutem extends Sprite
	{
		[Embed(source="../../../../../assets/planetcute/DirtBlock.png")] // TODO: deal with embeds
		
		private var AbstractCutemClass:Class;
		private var co:Bitmap = new AbstractCutemClass();
		
		public static var cutieWidthSprite:int = 101;
		public static var cutieHeightSprite:int = 171;
		public static var cutieWidth:int = 101;
		public static var cutieHeight:int = 121;
		public static var cutieThick:int = 42;
		
		public function AbstractCutem(name:String, x:int = 0, y:int = 0, z:int = 0)
		{
			this.width = AbstractCutemClass.cutieWidthSprite;
			this.height = AbstractCutemClass.cutieHeightSprite;
			co.width = cutieWidthSprite;
			co.height = cutieHeightSprite;
			co.x = 0; // TODO: coordinate calculations
			co.y = 0;
			addChild(co);
			//addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function locate(x:int = 0, y:int = 0, z:int = 0):void
		{
			this.x = x * cutieWidth;
			this.y = stage.stageHeight - cutieHeightSprite - y * (cutieHeight - cutieThick); //  + cutieHeight
			this.y -= z * cutieHeight;
			trace("Located to: " + this.x + ", " + this.y);
			// TODO: z axis position by layers or something
		}
	
	}

}