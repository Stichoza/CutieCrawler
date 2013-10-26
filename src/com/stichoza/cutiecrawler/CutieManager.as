package com.stichoza.cutiecrawler
{
	import com.stichoza.cutiecrawler.cuteplanet.AbstractCutem;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Stichoza
	 */
	public class CutieManager extends Sprite
	{
		private var maxBlocksX:int;
		private var maxBlocksY:int;
		private var maxBlocksZ:int;
		
		private var objectMatrix:Array;
		
		public function CutieManager(screenWidth:int, screenHeight:int)
		{
			maxBlocksX = screenWidth / AbstractCutem.cutieWidth;
			maxBlocksY = screenHeight / AbstractCutem.cutieHeight;
			maxBlocksZ = 5;
			
			this.objectMatrix = new Array(this.maxBlocksX);
			for (var x:int = 0; x < maxBlocksX; x++)
			{
				this.objectMatrix[x] = new Array(this.maxBlocksY);
				for (var y:int = 0; y < maxBlocksY; y++)
				{
					this.objectMatrix[x][y] = new Array(this.maxBlocksZ);
					for (var z:int = 0; z < maxBlocksZ; z++)
					{
						this.objectMatrix[x][y][z] = new Sprite();
					}
				}
			}
		
		}
		
		public function newCutie(name:String, x:int, y:int, z:int):Boolean
		{
			var obj:AbstractCutem = new AbstractCutem(name);
			if (!isEmpty(x, y, z))
				return false;
			objectMatrix[x][y][z] = obj;
			stage.addChild(objectMatrix[x][y][z]);
			obj.locate(x, y, z);
			return true;
		}
		
		public function isEmpty(x:int, y:int, z:int):Boolean
		{
			return objectMatrix[x][y][z] == null;
		}
	
	}

}