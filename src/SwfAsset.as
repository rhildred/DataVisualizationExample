package {
	import flash.net.URLRequest;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author rhildred
	 */
	public class SwfAsset extends Sprite {
		private var movieClip:MovieClip;
		private var loader:Loader = new Loader();
		public function SwfAsset() {
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,doneLoad);
			loader.load(new URLRequest("assets/frame_events.swf"));
			
		}

		private function doneLoad(event : Event) : void {
			movieClip = MovieClip(loader.content);
			addChild(movieClip);
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,doneLoad);
			loader = null;
			addEventListener(Event.ENTER_FRAME,onFrameLoop);

		}
		private function onFrameLoop(evt:Event):void {
			movieClip.x = mouseX;
			movieClip.cycle.wheel.rotation = mouseX;
		}			
	}
}
