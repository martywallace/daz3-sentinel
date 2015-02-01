package daz.world.services
{
	
	import daz.world.Pickup;
	import daz.world.World;
	import sentinel.framework.util.Random;
	import sentinel.gameplay.physics.Vector2D;
	import sentinel.gameplay.world.BaseWorld;
	import sentinel.gameplay.world.WorldService;
	
	
	public class PickupService extends WorldService
	{
		
		public function make(position:Vector2D, type:String):void
		{
			var pickup:Pickup = new Pickup(type);
			var veclocityRange:int = 120;
			
			if (!(world as World).hero.inventory.hasGun(Pickup.toGun(type)))
			{
				pickup.convertToGun();
			}
			
			world.add(pickup);
			
			pickup.body.linearVelocityX = Random.between(-veclocityRange, veclocityRange);
			pickup.body.linearVelocityY = Random.between(-veclocityRange, veclocityRange);
			pickup.body.angularVelocity = Random.between(-10, 10);
			
			pickup.moveTo(position.x, position.y);
			pickup.rotation = Random.getAngle();
		}
		
		
		public override function get name():String { return 'pickupService'; }
		
	}
	
}