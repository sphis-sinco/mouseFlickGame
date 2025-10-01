package sphis.mouseflickgame;

import flixel.FlxG;
import flixel.math.FlxPoint;

class MouseFlick
{
	public var previousMousePosition:FlxPoint = new FlxPoint();
	public var currentMousePosition:FlxPoint = new FlxPoint();

	public var FLICK_MINIMUM_X_DISTANCE:Float = 500;
	public var FLICK_MINIMUM_Y_DISTANCE:Float = 500;

	public var FLICK_EVENT:(xDistance:Float, yDistance:Float) -> Void;

	public function new(xMinDistance:Float = 500, yMinDistance:Float = 500)
	{
		FLICK_MINIMUM_X_DISTANCE = xMinDistance;
		FLICK_MINIMUM_Y_DISTANCE = yMinDistance;
	}

	public function update()
	{
		if (FlxG.mouse.justPressed)
		{
			previousMousePosition.set(FlxG.mouse.x, FlxG.mouse.y);
		}

		if (FlxG.mouse.justReleased)
		{
			currentMousePosition.set(FlxG.mouse.x, FlxG.mouse.y);

			if ((Math.abs(currentMousePosition.x - previousMousePosition.x) > FLICK_MINIMUM_X_DISTANCE)
				|| (Math.abs(currentMousePosition.y - previousMousePosition.y) > FLICK_MINIMUM_Y_DISTANCE))
				FLICK_EVENT((currentMousePosition.x - previousMousePosition.x), (currentMousePosition.y - previousMousePosition.y));
		}
	}
}
