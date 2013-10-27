package com.stichoza.cutiecrawler {
	import com.stichoza.cutiecrawler.cuteplanet.AbstractCutem;
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	
	/**
	 * ...
	 * @author Stichoza
	 */
	public class CutieManager extends Sprite {
		private var maxBlocksX:int;
		private var maxBlocksY:int;
		private var maxBlocksZ:int;
		
		private var objectMatrix:Array;
		
		public function CutieManager(screenWidth:int, screenHeight:int) {
			maxBlocksX = screenWidth / AbstractCutem.cutieWidth;
			maxBlocksY = screenHeight / AbstractCutem.cutieHeight;
			maxBlocksZ = 5;
			
			this.objectMatrix = new Array(this.maxBlocksX);
			for (var x:int = 0; x < maxBlocksX; x++) {
				this.objectMatrix[x] = new Array(this.maxBlocksY);
				for (var y:int = 0; y < maxBlocksY; y++) {
					this.objectMatrix[x][y] = new Array(this.maxBlocksZ);
					for (var z:int = 0; z < maxBlocksZ; z++) {
						this.objectMatrix[x][y][z] = new Sprite();
					}
				}
			}
		
		}
		
		public function newCutie(name:String, x:int, y:int, z:int):int {
			var obj:AbstractCutem = new AbstractCutem(name);
			if (!isEmpty(x, y, z)) {
				// if cell is already taken
				return 1;
			} else if (z != 0 && isEmpty(x, y, z - 1)) {
				// if cell has no lower level
				return 2;
			} else if (z != 0 && !objectMatrix[x][y][z - 1].isBuildable) {
				return 3;
			}
			objectMatrix[x][y][z] = obj;
			addChild(objectMatrix[x][y][z]);
			obj.locate(x, y, z);
			return 0;
		}
		
		public function isEmpty(x:int, y:int, z:int):Boolean {
			try {
				return (!objectMatrix[x][y][z].cutieWidth > 1);
			} catch (e:Error) {
				trace("Hey, it's catch from isEmpty(), " + e.message);
				return true;
			} finally {
				trace("Hmmm, weird.");
				return true;
			}
		
		}
	
	}

}