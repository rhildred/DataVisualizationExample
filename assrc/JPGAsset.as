package {
	import flash.net.URLRequest;
	import flash.display.Loader;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author rhildred
	 */
	public class JPGAsset extends Sprite {
		private var oImage:Bitmap;
		private var oLoader:Loader = new Loader();
		public function JPGAsset() {
			oLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoad);
			oLoader.load(new URLRequest("../img/space2.jpg"));
		}

		private function onLoad(event : Event) : void {
			oImage = Bitmap(oLoader.content);
			addChild(oImage);
			
			//following advice at end of LAS chapter 3
			oLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onLoad);
			oLoader = null;
		}

	}
}
