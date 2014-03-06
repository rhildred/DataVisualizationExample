package {
	import flash.display.MovieClip;
	import flash.net.URLRequest;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author rhildred
	 */
	public class SWFAsset extends Sprite {
		private var oMovieClip:MovieClip;
		private var oLoader:Loader = new Loader();
		public function SWFAsset() {
			oLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoad);
			oLoader.load(new URLRequest("assets/frame_events.swf"));
		}

		private function onLoad(event : Event) : void {
			oMovieClip = MovieClip(oLoader.content);
			addChild(oMovieClip);
			
			//following advice at end of LAS chapter 3
			oLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onLoad);
			oLoader = null;
			addEventListener(Event.ENTER_FRAME,onFrameLoop);
		}
		
		private function onFrameLoop(evt:Event):void {
			oMovieClip.cycle.x = mouseX;
			oMovieClip.cycle.wheel.rotation = mouseX;
		}
	}
}
