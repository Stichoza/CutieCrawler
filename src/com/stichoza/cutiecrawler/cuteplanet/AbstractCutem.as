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
		[Embed(source="../../../../../assets/planetcute/GrassBlock.png")]
		
		private var AbstractCutemClass:Class;
		private var co:Bitmap = new AbstractCutemClass();
		
		public static const cutieWidthSprite:int = 101;
		public static const cutieHeightSprite:int = 171;
		public static const cutieWidth:int = 101;
		public static const cutieHeight:int = 121;
		public static const cutieThick:int = 42;
		public static const cutieThickFactor:int = 1; // 1:normal, 2:tall
		
		public const isBuildable:Boolean = true;
		public const isStandable:Boolean = true;
		public const isPickable:Boolean = false;
		public const isAttackable:Boolean = false;
		
		public const isHealthChanger:Boolean = false;
		public const isTimeChanger:Boolean = false;
		public const isBagItem:Boolean = false;
		
		public const healthMod:int = 0; // if pickable + if healthChanger -> change health by (+/- int)
		public const itemName:String = ""; // if pickable + if bagItem -> put in bag
		public const damage:int = 0; // TODO: replace with healthMod negative
		
		public var debugName:String = "untitled";
		
		public function AbstractCutem(name:String, x:int = 0, y:int = 0, z:int = 0) {
			
			this.width = AbstractCutemClass.cutieWidthSprite;
			this.height = AbstractCutemClass.cutieHeightSprite;
			this.debugName = name;
			this.co.width = cutieWidthSprite;
			this.co.height = cutieHeightSprite;
			this.co.x = 0;
			this.co.y = 0;
			addChild(co);
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			//trace("Object " + this.debugName + " added to stage");
		}
		
		public function locate(x:int = 0, y:int = 0, z:int = 0):void {
			this.x = x * (cutieWidth - 1);
			this.y = stage.stageHeight - cutieHeightSprite - y * (cutieHeight - cutieThick + 5);
			this.y -= z * cutieThick;
			//trace("Location:   " + x + ",\t" + y + ",\t" + z + "\tCoord:   " + this.x + ",\t" + this.y);
		}
		
		public function locateAbsolute(x:Number, y:Number):void {
			this.x = x;
			this.y = y;
		}
	
	}

}