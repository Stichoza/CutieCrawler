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
		
		public static const cutieWidthSprite:int = 101;
		public static const cutieHeightSprite:int = 171;
		public static const cutieWidth:int = 101;
		public static const cutieHeight:int = 121;
		public static const cutieThick:int = 42;
		public static const cutieThickFactor:int = 1; // 1:normal, 2:tall
		
		public static const buildable:Boolean = true;
		public static const standable:Boolean = true;
		public static const pickable:Boolean = false;
		public static const attackable:Boolean = false;
		
		public static const healthChanger:Boolean = false;
		public static const timeChanger:Boolean = false;
		public static const bagItem:Boolean = false;
		
		public static const healthMod:int = 0; // if pickable + if healthChanger -> change health by (+/- int)
		public static const itemName:String = ""; // if pickable + if bagItem -> put in bag
		public static const damage:int = 0; // TODO: replace with helthMod
		
		
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
			this.y = stage.stageHeight - cutieHeightSprite - y * (cutieHeight - cutieThick + 2); //  + cutieHeight
			this.y -= z * cutieThick;
			trace("Location:   " + x + ",\t" + y + ",\t" + z + "\tCoord:   " + this.x + ",\t" + this.y);
		}
	
	}

}