package daz.world 
{
	
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Line;
	import sentinel.gameplay.physics.Vector2D;
	import sentinel.gameplay.world.Being;
	
	
	public class Projectile extends Being
	{
		
		private var _start:Vector2D;
		private var _end:Vector2D;
		private var _lifetime:int = 2;
		
		
		public function Projectile(start:Vector2D, end:Vector2D)
		{
			super();
			
			_start = start;
			_end = end;
		}
		
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Line = new Line(_start.toPoint(), _end.toPoint(), 2);
			
			graphics.depth = DAZWorld.DEPTH_PROJECTILES;
			graphics.alpha = 0.5;
			
			return graphics;
		}
		
		
		protected override function update():void
		{
			// Projectiles only render for one frame.
			if(--_lifetime <= 0) deconstruct();
		}
		
	}

}