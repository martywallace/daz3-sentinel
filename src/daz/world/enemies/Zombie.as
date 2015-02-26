package daz.world.enemies 
{
	
	import daz.world.World;
	import daz.world.Pickup;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Image;
	import sentinel.framework.graphics.Sprite;
	import sentinel.framework.util.Align;
	import sentinel.framework.util.Random;
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Circle;
	import sentinel.gameplay.physics.Engine;
	import sentinel.gameplay.physics.FixtureDef;
	import sentinel.gameplay.world.IGroupable;
	
	
	public class Zombie extends Enemy
	{
		
		protected override function defineHealth():int{ return 6; }
		protected override function defineSpeed():Number { return 90; }
		
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Sprite = new Sprite();
			
			var head:Image = library.getImageFromSheet('all', 'zombieHead' + Random.fromArray([1, 2, 3]));
			var shoulders:Image = library.getImageFromSheet('all', 'zombieShoulders' + Random.fromArray([1, 2, 3]));
			var arm1:Image = library.getImageFromSheet('all', 'zombieArm' + Random.fromArray([1, 2, 3]));
			var arm2:Image = library.getImageFromSheet('all', 'zombieArm' + Random.fromArray([1, 2, 3]));
			
			head.alignPivot();
			shoulders.alignPivot();
			arm1.alignPivot(Align.LEFT, Align.CENTER);
			arm2.alignPivot(Align.LEFT, Align.CENTER);
			
			arm1.y = -15;
			arm2.y = 15;
			arm1.x = -5;
			arm2.x = -5;
			arm1.scaleY = -1;
			
			graphics.addChild(arm1);
			graphics.addChild(arm2);
			graphics.addChild(shoulders);
			graphics.addChild(head);
			
			graphics.depth = World.DEPTH_CREATURES;
			
			return graphics;
		}
		
		
		protected override function defineBody(engine:Engine):Body
		{
			var body:Body = engine.createBody(Body.DYNAMIC, this);
			
			body.createFixture(new Circle(20), new FixtureDef(1500));
			body.linearDamping = 8;
			
			return body;
		}
		
		
		protected override function definePickupTypes():Vector.<String>
		{
			return new <String>[Pickup.HANDGUN_AMMO, Pickup.MACHINEGUN_AMMO, Pickup.SHOTGUN_AMMO, Pickup.HEALTHPACK];
		}
		
		
		protected override function attack():void
		{
			(world as World).hero.takeDamage(1);
		}
		
	}

}