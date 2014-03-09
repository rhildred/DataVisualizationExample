package {
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLLoader;
	import flash.net.URLRequestMethod;
	import flash.net.URLRequestHeader;
	import flash.net.URLRequest;
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author rhildred
	 */
	public class Random extends Sprite {
		private var loader:URLLoader=new URLLoader();
		
		public function Random() {
			var request:URLRequest=new URLRequest("/random");
			request.requestHeaders=[new URLRequestHeader("Content-Type", "application/json")];
			request.method=URLRequestMethod.GET;
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.addEventListener(Event.COMPLETE, receive);
			loader.load(request);
		}
		private var aContents:Object;
		private function receive(event : Event) : void {
			aContents = JSON.parse(String(loader.data));
			graphics.lineStyle(4, 0x442266);
			for(var n: Number = 0;n < aContents['length']; n++){
				if(n == 0) graphics.moveTo(n*25, aContents[n]['y'] * 20);
				else graphics.lineTo(n*25, aContents[n]['y'] * 20);
			}
		}
	}
}
