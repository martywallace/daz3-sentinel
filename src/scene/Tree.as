package scene 
{
	
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Image;
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Circle;
	import sentinel.gameplay.physics.Engine;
	import sentinel.gameplay.world.Being;
	import sentinel.gameplay.world.IQueryable;
	
	
	public class Tree extends Being implements IQueryable
	{
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Image = library.getImage('tree');
			
			graphics.depth = DAZWorld.DEPTH_NATURE;
			graphics.alignPivot();
			
			rotation = Math.random() * Math.PI * 2;
			
			return graphics;
		}
		
		
		protected override function defineBody(engine:Engine):Body
		{
			var body:Body = engine.createBody(Body.STATIC, this);
			body.createFixture(new Circle(40));
			
			return body;
		}
		
	}

}