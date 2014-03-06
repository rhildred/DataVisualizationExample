package {
	import flash.net.URLRequest;
	import flash.display.Loader;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author rhildred
	 */
	public class Asset extends Sprite {
		private var image:Bitmap;
		private var loader:Loader = new Loader();

		public function Asset() {
			addChild(loader);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,doneLoad);
			loader.load(new URLRequest("assets/space2.jpg"));
		}

		private function doneLoad(event : Event) : void {
			image = Bitmap(loader.content);
			addChild(image);
			image.x=65;
			image.y=50;
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,doneLoad);
			loader = null;
		}
	}
}
