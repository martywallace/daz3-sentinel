package daz.world.enemies 
{
	
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Image;
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Circle;
	import sentinel.gameplay.physics.Engine;
	import daz.world.Pickup;
	import sentinel.gameplay.physics.FixtureDef;
	
	
	public class Mummy extends Enemy
	{
		
		protected override function defineHealth():int { return 14; }
		protected override function defineSpeed():Number { return 55; }
		
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Image = library.getImageFromSheet('all', 'mummy');
			graphics.alignPivot();
			
			return graphics;
		}
		
		
		protected override function defineBody(engine:Engine):Body
		{
			var body:Body = engine.createBody(Body.DYNAMIC, this);
			body.createFixture(new Circle(22), new FixtureDef(2000));
			
			return body;
		}
		
		
		protected override function definePickupTypes():Vector.<String>
		{
			return new <String>[Pickup.HANDGUN, Pickup.SHOTGUN, Pickup.MACHINEGUN];
		}
		
	}

}