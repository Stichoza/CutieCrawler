package com.stichoza.cutiecrawler.cuteplanet
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Stichoza
	 */
	public class AbstractCutem extends Sprite
	{
		[Embed(src="/assets/planetcute/WoodBlock.png")]; // TODO: deal with embeds
		private var AbstractCutemClass:Class;
		private var AbstractCutemPNG:Bitmap = new AbstractCutemClass();
		
		protected var name;
		
		public function AbstractCutem(name, x = 0, y = 0, z = 0)
		{
			this.name = name;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init()
		{
			trace("ac init");
			removeEventListener(Event.ADDED_TO_STAGE, init);
			AbstractCutemPNG.height = 171;
			AbstractCutemPNG.width = 101;
			addChild(AbstractCutemPNG);
		}
	
	}

}