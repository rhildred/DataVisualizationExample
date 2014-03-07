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
		private var oWheel:Bitmap;
		private var oLoader:Loader = new Loader();

		public function Wheel() {
			oLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaded);
			oLoader.load(new URLRequest("assets/wheel.png"));
		}

		private function loaded(event : Event) : void {
			oWheel = Bitmap(oLoader.content);
			addChild(oWheel);
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}

		private function enterFrame(event : Event) : void {
			//oWheel.x = mouseX;
			var oMatrix:Matrix = oWheel.transform.matrix;
			var oRect:Rectangle = oWheel.getBounds(this);
			oMatrix.translate(- (oRect.left + (oRect.width/2)), - (oRect.top + (oRect.height/2)));
			oMatrix.rotate(mouseX%180/180 * Math.PI);
			oMatrix.translate(oRect.left + (oRect.width/2), oRect.top + (oRect.height/2));
			oWheel.transform.matrix = oMatrix;
		}
	}
}
