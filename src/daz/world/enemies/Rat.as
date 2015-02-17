package daz.world.enemies
{
	
	import daz.world.Pickup;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Image;
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Box;
	import sentinel.gameplay.physics.Engine;
	import sentinel.gameplay.physics.FixtureDef;
	
	
	public class Rat extends Enemy
	{
		
		protected override function defineHealth():int { return 3; }
		protected override function defineSpeed():Number { return 75; }
		
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Image = library.getImageFromSheet('all', 'rat');
			graphics.alignPivot();
			
			return graphics;
		}
		
		
		protected override function defineBody(engine:Engine):Body
		{
			var body:Body = engine.createBody(Body.DYNAMIC, this);
			body.createFixture(new Box(40, 12), new FixtureDef(1000));
			
			return body;
		}
		
		
		protected override function definePickupTypes():Vector.<String>
		{
			return new <String>[Pickup.HANDGUN_AMMO];
		}
		
	}
	
}