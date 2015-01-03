package daz.world
{
	
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Quad;
	import sentinel.framework.graphics.Sprite;
	import sentinel.gameplay.world.BoundaryBox;
	import sentinel.framework.util.Align;
	
	
	public class Bounds extends BoundaryBox
	{
		
		public function Bounds()
		{
			super(1100, 1500);
		}
		
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Sprite = new Sprite();
			
			graphics.alpha = 0.4;
			graphics.depth = World.DEPTH_OVERLAY;
			
			var color:uint = 0;
			
			var top:Quad = new Quad(2000, 600, color);
			var bottom:Quad = new Quad(2000, 600, color);
			var left:Quad = new Quad(600, 1500, color);
			var right:Quad = new Quad(600, 1500, color);
			
			top.alignPivot(Align.CENTER, Align.BOTTOM);
			bottom.alignPivot(Align.CENTER, Align.TOP);
			left.alignPivot(Align.RIGHT, Align.CENTER);
			right.alignPivot(Align.LEFT, Align.CENTER);
			
			top.y = -750;
			bottom.y = 750;
			left.x = -550;
			right.x = 550;
			
			graphics.addChild(top);
			graphics.addChild(bottom);
			graphics.addChild(left);
			graphics.addChild(right);
			
			return graphics;
		}
		
	}
	
}