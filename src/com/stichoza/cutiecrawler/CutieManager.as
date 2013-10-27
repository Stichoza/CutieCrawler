package com.stichoza.cutiecrawler {
	import com.stichoza.cutiecrawler.cuteplanet.AbstractCutem;
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Stage;
	
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
				trace("non-empty cell " + x + "," + y + "," + z);
				return 1;
			} else if (z != 0 && isEmpty(x, y, z - 1)) {
				// if cell has no lower level
				trace("non-floored cell " + x + "," + y + "," + z);
				return 2;
			} else if (z != 0 && !objectMatrix[x][y][z - 1].isBuildable) {
				trace("non-bulbale cell " + x + "," + y + "," + z);
				return 3;
			}
			trace("creating cutie on " + x + "," + y + "," + z);
			objectMatrix[x][y][z] = obj;
			addChild(objectMatrix[x][y][z]); // TODO: add to stage not somewhere in the fuck
			objectMatrix[x][y][z].locate(x, y, z);
			return 0;
		}
		
		public function isEmpty(x:int, y:int, z:int):Boolean {
			try {
				return (!!!objectMatrix[x][y][z].cutieWidth);
			} catch (e:Error) {
				trace("Hey, it's catch from isEmpty(), " + e.message);
			} finally {
				trace(":v");
			}
			return true;
		}
	
	}

}