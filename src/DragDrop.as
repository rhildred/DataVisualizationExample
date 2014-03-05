package {
	import flash.events.MouseEvent;
	import flash.display.Sprite;

	/**
	 * @author rhildred
	 */
	public class DragDrop extends Sprite {

		public function DragDrop() {
			var circle: Sprite = new Sprite();
			circle.graphics.beginFill(0xff0000);
			circle.graphics.drawCircle(100, 100, 20);
			addChild(circle);
			var circle2: Sprite = new Sprite();
			circle2.graphics.beginFill(0x0000ff);
			circle2.graphics.drawCircle(300, 100, 20);
			addChild(circle2);
			this.addEventListener(MouseEvent.MOUSE_DOWN, onStartDrag);
			this.addEventListener(MouseEvent.MOUSE_UP, onStopDrag);
		}

		private function onStartDrag(event : MouseEvent) : void {
			event.target.startDrag();
		}

		private function onStopDrag(event : MouseEvent) : void {
			stopDrag();
		}

	}
}
