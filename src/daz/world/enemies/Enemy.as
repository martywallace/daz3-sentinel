package daz.world.enemies 
{
	
	import daz.world.Creature;
	import daz.world.DAZWorld;
	import daz.world.Hero;
	import sentinel.framework.util.Random;
	
	
	public class Enemy extends Creature
	{
		
		protected override function update():void
		{
			var hero:Hero = (world as DAZWorld).hero;
			
			if (hero !== null)
			{
				rotation = position.angleTo(hero.position);
				
				if (position.distanceTo(hero.position) > 60)
				{
					body.linearVelocityX = position.cosTo(hero.position) * speed;
					body.linearVelocityY = position.sinTo(hero.position) * speed;
				}
				else
				{
					// Attack.
					attack();
				}
			}
			
			super.update();
		}
		
		
		protected override function die():void
		{
			super.die();
			
			if (Random.roll(0.3))
			{
				dropPickup();
			}
			
			deconstruct();
		}
		
		
		protected function definePickupTypes():Vector.<String>
		{
			return null;
		}
		
		
		protected function dropPickup():void
		{
			var types:Vector.<String> = definePickupTypes();
			
			if (types !== null)
			{
				var type:String = types[int(Random.between(0, types.length))];
				
				(world as DAZWorld).pickupService.make(position, type);
			}
		}
		
		
		protected function attack():void
		{
			// Override and define attack mechanism.
			// ...
		}
		
	}

}