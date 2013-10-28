package com.stichoza.cutiecrawler {
	import com.stichoza.cutiecrawler.cuteplanet.AbstractCutem;
	import com.stichoza.cutiecrawler.error.MatrixError;
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Stage;
	
	/**
	 * ...
	 * @author Stichoza
	 */
	public class CutieManager {
		public var maxBlocksX:int;
		public var maxBlocksY:int;
		public var maxBlocksZ:int;
		
		private var objectMatrix:Array;
		
		public var stageRef:Stage;
		
		public function CutieManager(fakeStage:Stage) {
			this.stageRef = fakeStage;
			var screenWidth:int = fakeStage.stageWidth;
			var screenHeight:int = fakeStage.stageHeight;
			maxBlocksX = screenWidth / AbstractCutem.cutieWidth + 1;
			maxBlocksY = screenHeight / (AbstractCutem.cutieHeight - AbstractCutem.cutieThick);
			maxBlocksZ = 5;
			this.objectMatrix = new Array(this.maxBlocksX);
			for (var x:int = 0; x <= maxBlocksX; x++) {
				this.objectMatrix[x] = new Array(this.maxBlocksY);
				for (var y:int = 0; y <= maxBlocksY; y++) {
					this.objectMatrix[x][y] = new Array(this.maxBlocksZ);
					for (var z:int = 0; z <= maxBlocksZ; z++) {
						this.objectMatrix[x][y][z];
						trace("x:"+x+" y:"+y+" z:"+z);
					}
				}
			}
			trace("CutieManager instance");
			trace("W:" + screenWidth + "\tH:" + screenHeight);
			trace("mX:" + maxBlocksX + "\tmY:" + maxBlocksY + "\tmZ:" + maxBlocksZ);
			trace("aX:" + maxBlocksX + "\taY:" + maxBlocksY + "\taZ:" + maxBlocksZ);
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
					throw new MatrixError("Z-stack is full", 1);
				}
			}
			if (x >= this.maxBlocksX || y >= this.maxBlocksY || z >= this.maxBlocksZ) {
				throw new MatrixError("Out of matrix bounds", 2);
			}
			if (!isEmpty(x, y, z)) {
				throw new MatrixError("Cell not empty", 3);
			}
			if (z > 0 && isEmpty(x, y, z - 1)) {
				throw new MatrixError("Cell has no lower level block", 4);
			}
			if (z > 0 && !objectMatrix[x][y][z - 1].isBuildable) {
				throw new MatrixError("Lower level block in not buildable", 5);
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
				var tmpObj:AbstractCutem = this.objectMatrix[x][y][z];
				result = !(tmpObj.debugName);
				trace(tmpObj.debugName + " -- " + result);
				//result = (this.objectMatrix[x][y][z] != null);
			} catch (e:Error) {
				result = true;
			}
			return result;
		}
		
		public function sortLayers():void {
			
		}
		
		public function getObject(x:int, y:int, z:int):AbstractCutem {
			var obj:AbstractCutem;
			try {
				obj = this.objectMatrix[x][y][z];
			} catch (e:Error) {
				trace(e.message);
			}
			return obj;
		}
	
	}

}