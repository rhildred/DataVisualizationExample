package {
	import flash.geom.Rectangle;
	import flash.geom.Matrix;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.display.Loader;
	import flash.display.Bitmap;
	import flash.display.Sprite;

	/**
	 * @author rhildred
	 */
	public class Wheel extends Sprite {
		private var oWheel:Bitmap = null;
		private var oBike:Bitmap = null;
		// 2 loaders, one 2 load bike and the other the wheel
		private var oLoaderBike:Loader = new Loader(),
			oLoaderWheel:Loader = new Loader();

		public function Wheel() {
			oLoaderWheel.contentLoaderInfo.addEventListener(Event.COMPLETE, loaded);
			oLoaderBike.contentLoaderInfo.addEventListener(Event.COMPLETE, loaded);
			// pngs exported from flash professional as png sequence
			oLoaderWheel.load(new URLRequest("../img/wheel.png"));
			oLoaderBike.load(new URLRequest("../img/bike.png"));
		}

		private function loaded(event : Event) : void {
			oWheel = Bitmap(oLoaderWheel.content);
			oBike = Bitmap(oLoaderBike.content);
			// this seems to be called twice, but by the time it is called the first time, both assets seem to be there
			if(oBike != null && oWheel != null ){
				// both assets are for sure here so we clean up like in LAS chapter 3
				oLoaderWheel.contentLoaderInfo.removeEventListener(Event.COMPLETE, loaded);
				oLoaderBike.contentLoaderInfo.removeEventListener(Event.COMPLETE, loaded);
				oLoaderWheel = oLoaderBike = null;
				// add loaded assets to the screen
				addChild(oWheel);
				addChild(oBike);
				oBike.y = 21;
				// draw the first frame so that we don't get our assets in the wrong place on the screen
				enterFrame(null);
				// add listener to redraw 24 fps
				addEventListener(Event.ENTER_FRAME, enterFrame);
				
			}
		}
		// these constants adjust the png relative placement
		private const centerXOffs:Number = -3;
		private const centerYOffs:Number = 2;
		private const bikeXOffset:Number = 14;
		private const bikeYOffset:Number = 155;
		private function enterFrame(event : Event) : void {
			// the bike we just move with the mouse
			oBike.x = mouseX;
			oWheel.rotation = mouseX;
			// transform center of wheel and move it at the same time
			var oMatrix:Matrix = oWheel.transform.matrix;
			var oRect:Rectangle = oWheel.getBounds(this);
			oMatrix.translate((- (oRect.left + ((oRect.width + centerXOffs)/2))) + mouseX + bikeXOffset, 
			(- (oRect.top + ((oRect.height+centerYOffs)/2)))+bikeYOffset);
			oWheel.transform.matrix = oMatrix;
		}
	}
}
