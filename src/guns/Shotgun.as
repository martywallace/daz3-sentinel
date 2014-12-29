package guns
{
	
	import scene.Creature;
	import scene.Pickup;
	import sentinel.gameplay.world.World;
	
	
	public class Shotgun extends BulletGun
	{
		
		public function Shotgun()
		{
			_damage = 1;
			_clipSize = 4;
			_clipAmmo = 4;
			_totalAmmo = 2;
			_cooldownDelay = 50;
			_reloadDelay = 120;
			_errorAngle = 3;
			
			super(Pickup.SHOTGUN, Pickup.SHOTGUN_AMMO);
		}
		
		
		protected override function fire(user:Creature, world:World):void
		{
			for (var i:int = 0; i < 8; i++)
			{
				fireBullet(user.position, user.rotation, world);
			}
		}
		
	}
	
}