package {
	import flash.display.Shape;
	import flash.display.Sprite;

	/**
	 * @author rhildred
	 */
	public class DataVisualizationExample extends Sprite {
		public function DataVisualizationExample() {
			var circle: Shape = new Shape();
			circle.graphics.beginFill(0xff0000);
			circle.graphics.drawCircle(20, 20, 20);
			addChild(circle);
		}
	}
}
