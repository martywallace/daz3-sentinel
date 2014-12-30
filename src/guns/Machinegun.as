package guns
{
	
	import scene.Pickup;
	
	
	public class Machinegun extends BulletGun
	{
		
		public function Machinegun()
		{
			_damage = 1;
			_cooldownDelay = 8;
			_reloadDelay = 75;
			_clipSize = 24;
			_clipAmmo = 24;
			_offset = 50;
			_errorAngle = 0.15;
			
			super(Pickup.MACHINEGUN, Pickup.MACHINEGUN_AMMO);
		}
		
	}
	
}