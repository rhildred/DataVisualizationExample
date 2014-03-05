package {
	import flash.events.Event;
	import flash.text.TextField;
	import flash.display.Sprite;

	/**
	 * @author rhildred
	 */
	public class HelloWorldFrame extends Sprite {
		private var txtField: TextField = new TextField();
		private var str:String = "Hello World!";
		private var len:int = str.length;
		private var i:int = 0;
		public function HelloWorldFrame() {
			txtField.textColor = 0xff0000;
			addChild(txtField);
			this.addEventListener(Event.ENTER_FRAME, onEnter, false, 0, true);
		}
		public function onEnter(evt:Event):void {
			txtField.appendText(str.charAt(i));
			i++;
			if(i > len){
				removeEventListener(Event.ENTER_FRAME, onEnter);
			}
		}
	}
}
