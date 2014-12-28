package guns
{
	
	import scene.Creature;
	import scene.Enemy;
	import scene.Pickup;
	import scene.Projectile;
	import sentinel.framework.util.Random;
	import sentinel.gameplay.physics.Vector2D;
	import sentinel.gameplay.world.Query;
	import sentinel.gameplay.world.World;
	import sentinel.gameplay.world.WorldQueryResult;
	
	
	public class Handgun extends Gun
	{
		
		public function Handgun()
		{
			_damage = 2;
			
			super(Pickup.HANDGUN, Pickup.HANDGUN_AMMO);
		}
		
		
		protected override function fire(user:Creature, world:World):void
		{
			var projectile:Projectile;
			var at:Vector2D = user.position.cast(user.rotation + Random.between(-0.1, 0.1), 500);
			var qr:Vector.<WorldQueryResult> = world.query(Query.line(user.position, at, 1));
			
			if (qr.length > 0)
			{
				for each(var result:WorldQueryResult in qr)
				{
					if (result.being is Enemy)
					{
						(result.being as Enemy).takeDamage(_damage);
					}
				}
				
				projectile = new Projectile(user.position, qr[0].point);
			}
			else
			{
				projectile = new Projectile(user.position, at);
			}
			
			
			world.add(projectile);
		}
		
	}
	
}