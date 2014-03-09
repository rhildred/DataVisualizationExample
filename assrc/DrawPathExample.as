package {
	import flash.display.*;

	public class DrawPathExample extends Sprite {
		public function DrawPathExample() {
			var square_commands : Vector.<int> = new Vector.<int>(5, true);
			square_commands[0] = 1;
			// moveTo
			square_commands[1] = 2;
			// lineTo
			square_commands[2] = 2;
			square_commands[3] = 2;
			square_commands[4] = 2;

			var square_coord : Vector.<Number> = new Vector.<Number>(10, true);
			square_coord[0] = 20;
			// x
			square_coord[1] = 10;
			// y
			square_coord[2] = 50;
			square_coord[3] = 10;
			square_coord[4] = 50;
			square_coord[5] = 40;
			square_coord[6] = 20;
			square_coord[7] = 40;
			square_coord[8] = 20;
			square_coord[9] = 10;

			graphics.lineStyle(4, 0x442266);
			// set the color
			graphics.drawPath(square_commands, square_coord);
		}
	}
}