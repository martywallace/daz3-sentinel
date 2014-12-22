package scene 
{
	
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Image;
	import sentinel.gameplay.world.Being;
	
	
	public class Background extends Being
	{
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Image =  library.getImage('background');
			graphics.depth = DAZWorld.DEPTH_BACKGROUND;
			
			return graphics;
		}
		
	}

}