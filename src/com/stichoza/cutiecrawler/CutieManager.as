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
	public class CutieManager {
		private var maxBlocksX:int;
		private var maxBlocksY:int;
		private var maxBlocksZ:int;
		
		private var objectMatrix:Array;
		
		public var stageRef:Stage;
		
		public function CutieManager(fakeStage:Stage) {
			this.stageRef = fakeStage;
			var screenWidth:int = fakeStage.stageWidth;
			var screenHeight:int = fakeStage.stageHeight;
			maxBlocksX = screenWidth / AbstractCutem.cutieWidth;
			maxBlocksY = screenHeight / AbstractCutem.cutieHeight;
			maxBlocksZ = 5;
			
			this.objectMatrix = new Array(this.maxBlocksX);
			for (var x:int = 0; x < maxBlocksX; x++) {
				this.objectMatrix[x] = new Array(this.maxBlocksY);
				for (var y:int = 0; y < maxBlocksY; y++) {
					this.objectMatrix[x][y] = new Array(this.maxBlocksZ);
					for (var z:int = 0; z < maxBlocksZ; z++) {
						this.objectMatrix[x][y][z] = null;
					}
				}
			}
		}
		
		public function newCutie(name:String, x:int, y:int, z:int = -1):int {
			
			var obj:AbstractCutem = new AbstractCutem(name);
			
			if (z < 0) {
				trace("finding first empty Z index for " + x + "," + y);
				for (var i:int = 0; i < this.maxBlocksZ; i++) {
					if (isEmpty(x, y, i)) {
						trace("found Z: " + i);
						z = i;
						break;
					}
				}
				if (z < 0) {
					trace("Column is full");
					return 4; // column is full
				}
			}
			
			if (!isEmpty(x, y, z)) {
				// if cell is already taken
				trace("non-empty cell\t" + x + "," + y + "," + z);
				return 1;
			} else if (z > 0 && isEmpty(x, y, z - 1)) {
				// if cell has no lower level
				trace("non-floored cell\t" + x + "," + y + "," + z);
				return 2;
			} else if (z > 0 && !objectMatrix[x][y][z - 1].isBuildable) {
				trace("non-bulbale cell\t" + x + "," + y + "," + z);
				return 3;
			}
			
			trace("creating cutie on " + x + "," + y + "," + z);
			objectMatrix[x][y][z] = obj;
			this.stageRef.addChild(objectMatrix[x][y][z]);
			objectMatrix[x][y][z].locate(x, y, z);
			return 0;
		}
		
		public function isEmpty(x:int, y:int, z:int):Boolean {
			var result:Boolean = true;
			try {
				//result = !(this.objectMatrix[x][y][z] is AbstractCutem);
				result = (this.objectMatrix[x][y][z] !== null);
			} catch (e:Error) {
				// trace(e.message);
			} finally {
				result = true;
			}
			return result;
		}
	
	}

}