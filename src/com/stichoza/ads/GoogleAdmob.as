package com.stichoza.ads {
	import com.hdi.nativeExtensions.NativeAdsEvent;
	import com.hdi.nativeExtensions.NativeAds;
	import flash.system.Capabilities;
	
	/**
	 * ...
	 * @author Stichoza
	 */
	public class GoogleAdmob {
		
		private var adUnitID:String;
		private var screenWidth:Number = Capabilities.screenResolutionX;
		private var screenHeight:Number = Capabilities.screenResolutionY;
		private var adWidth:Number = 320;
		private var adHeight:Number = 50;
		private var adPositionX:Number = 20;
		private var adPositionY:Number = 20;
		
		public function GoogleAdmob(adUnitID:String = "a150638d8cbb659") {
			trace(this.screenHeight + " " +this.screenWidth);
			this.adUnitID = adUnitID;
			this.adWidth = (this.screenWidth >= 480) ? 480 : 320;
			this.adHeight = (this.adWidth == 480) ? 75 : 50;
			this.adPositionX = (this.screenWidth - this.adWidth) / 2;
			this.adPositionY = this.screenHeight - this.adHeight - 50;
			
			NativeAds.setUnitId(this.adUnitID);
			NativeAds.setAdMode(true);
			NativeAds.initAd(20, 20, 320, 50);
			//NativeAds.dispatcher.addEventListener(NativeAdsEvent.AD_RECEIVED,onAdReceived);
			//NativeAds.showAd(0, stage.stageHeight-500, 480, 75);
			NativeAds.showAd(this.adPositionX, this.adPositionY, this.screenWidth, this.adHeight);
		}
	
	}

}