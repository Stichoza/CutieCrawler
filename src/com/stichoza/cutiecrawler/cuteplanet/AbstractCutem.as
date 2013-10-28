package com.stichoza.cutiecrawler.cuteplanet {
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.DisplayObject;
	
	/**
	 * ...
	 * @author Stichoza
	 */
	public class AbstractCutem extends Sprite {
		[Embed(source="../../../../../assets/planetcute/DirtBlock.png")]
		
		private var AbstractCutemClass:Class;
		private var co:Bitmap = new AbstractCutemClass();
		
		public static const cutieWidthSprite:int = 101;
		public static const cutieHeightSprite:int = 171;
		public static const cutieWidth:int = 101;
		public static const cutieHeight:int = 121;
		public static const cutieThick:int = 42;
		public static const cutieThickFactor:int = 1; // 1:normal, 2:tall
		
		public static const isBuildable:Boolean = true;
		public static const isStandable:Boolean = true;
		public static const isPickable:Boolean = false;
		public static const isAttackable:Boolean = false;
		
		public static const isHealthChanger:Boolean = false;
		public static const isTimeChanger:Boolean = false;
		public static const isBagItem:Boolean = false;
		
		public static const healthMod:int = 0; // if pickable + if healthChanger -> change health by (+/- int)
		public static const itemName:String = ""; // if pickable + if bagItem -> put in bag
		public static const damage:int = 0; // TODO: replace with healthMod negative
		
		public var debugName:String = "untitled";
		
		public function AbstractCutem(name:String, x:int = 0, y:int = 0, z:int = 0) {
			this.width = AbstractCutemClass.cutieWidthSprite;
			this.height = AbstractCutemClass.cutieHeightSprite;
			this.debugName = name;
			co.width = cutieWidthSprite;
			co.height = cutieHeightSprite;
			co.x = 0;
			co.y = 0;
			addChild(co);
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			//trace("Object " + this.debugName + " added to stage");
		}
		
		public function locate(x:int = 0, y:int = 0, z:int = 0):void {
			this.x = x * cutieWidth;
			this.y = stage.stageHeight - cutieHeightSprite - y * (cutieHeight - cutieThick + 2);
			this.y -= z * cutieThick;
			//trace("Location:   " + x + ",\t" + y + ",\t" + z + "\tCoord:   " + this.x + ",\t" + this.y);
		}
	
	}

}