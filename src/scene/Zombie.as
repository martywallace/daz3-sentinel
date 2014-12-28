package scene 
{
	
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Image;
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Circle;
	import sentinel.gameplay.physics.Engine;
	import sentinel.gameplay.world.IGroupable;
	
	
	public class Zombie extends Enemy implements IGroupable
	{
		
		protected override function defineHealth():int
		{
			return 12;
		}
		
		
		protected override function defineSpeed():Number
		{
			return 90;
		}
		
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Image = library.getImage('zombie');
			graphics.alignPivot();
			
			return graphics;
		}
		
		
		protected override function defineBody(engine:Engine):Body
		{
			var body:Body = engine.createBody(Body.DYNAMIC, this);
			
			body.createFixture(new Circle(25));
			body.linearDamping = 8;
			
			return body;
		}
		
		
		protected override function attack():void
		{
			(world as DAZWorld).hero.takeDamage(1);
		}
		
		
		public function get groupName():String { return 'zombies'; }
		public function get nameInGroup():String { return 'zombie' + id; }
		
	}

}