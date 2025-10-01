package sphis.mouseflickgame;

import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.util.FlxSignal;

class MouseFlick
{
	public var previousMousePosition:FlxPoint = new FlxPoint();
	public var currentMousePosition:FlxPoint = new FlxPoint();

	public static var FLICK_MINIMUM_X_DISTANCE:Float = 500;
	public static var FLICK_MINIMUM_Y_DISTANCE:Float = 500;

	public static var FLICK_EVENT:FlxSignal = new FlxSignal();

	public function update()
	{
		if (FlxG.mouse.justPressed)
		{
			previousMousePosition.set(FlxG.mouse.x, FlxG.mouse.y);
		}

		if (FlxG.mouse.justReleased)
		{
			currentMousePosition.set(FlxG.mouse.x, FlxG.mouse.y);

			if (((currentMousePosition.x - previousMousePosition.x) > FLICK_MINIMUM_X_DISTANCE)
				|| ((currentMousePosition.y - previousMousePosition.y) > FLICK_MINIMUM_Y_DISTANCE))
				FLICK_EVENT.dispatch();
		}
	}
}
