package;

import flixel.FlxState;
import sphis.mouseflickgame.MouseFlick;

using Std;

class PlayState extends FlxState
{
	public var flick:MouseFlick = new MouseFlick(500, 500);

	override public function create()
	{
		super.create();

		flick.FLICK_EVENT = (xDistance, yDistance) ->
		{
			trace('--------------------------FLICK_EVENT--------------------------');
			trace('xD: ' + xDistance.string());
			trace('yD: ' + yDistance.string());
			trace('---------------------------------------------------------------');
			trace('left: ' + (xDistance < -flick.FLICK_MINIMUM_X_DISTANCE).string());
			trace('right: ' + (xDistance > flick.FLICK_MINIMUM_X_DISTANCE).string());
			trace('up: ' + (yDistance < -flick.FLICK_MINIMUM_Y_DISTANCE).string());
			trace('down: ' + (yDistance > flick.FLICK_MINIMUM_Y_DISTANCE).string());
		};
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		flick.update();
	}
}
