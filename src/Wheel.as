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
		private var oLoaderBike:Loader = new Loader(),
			oLoaderWheel:Loader = new Loader();

		public function Wheel() {
			trace("oBike is: " + oBike);
			trace("oWheel is: " + oWheel);
			oLoaderWheel.contentLoaderInfo.addEventListener(Event.COMPLETE, loaded);
			oLoaderWheel.load(new URLRequest("assets/wheel.png"));
			oLoaderBike.contentLoaderInfo.addEventListener(Event.COMPLETE, loaded);
			oLoaderBike.load(new URLRequest("assets/bike.png"));
		}

		private function loaded(event : Event) : void {
			oWheel = Bitmap(oLoaderWheel.content);
			oBike = Bitmap(oLoaderBike.content);
			addChild(oWheel);
			addChild(oBike);
			oBike.y = 21;
			if(oBike != null && oWheel != null ) addEventListener(Event.ENTER_FRAME, enterFrame);
		}

		private function enterFrame(event : Event) : void {
			oBike.x = mouseX;
			oWheel.rotation = mouseX;
			var oMatrix:Matrix = oWheel.transform.matrix;
			var oRect:Rectangle = oWheel.getBounds(this);
			oMatrix.translate((- (oRect.left + ((oRect.width+1)/2))) + mouseX, (- (oRect.top + ((oRect.height+2)/2)))+150);
			oWheel.transform.matrix = oMatrix;
			//oWheel.x = mouseX;
		}
	}
}
