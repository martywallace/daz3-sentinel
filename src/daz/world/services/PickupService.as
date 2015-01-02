package daz.world.services
{
	
	import daz.world.Pickup;
	import sentinel.framework.util.Random;
	import sentinel.gameplay.physics.Vector2D;
	import sentinel.gameplay.world.World;
	import sentinel.gameplay.world.WorldService;
	
	
	public class PickupService extends WorldService
	{
		
		public function make(position:Vector2D, type:String):void
		{
			var veclocityRange:int = 120;
			var pickup:Pickup = new Pickup(type);
			
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