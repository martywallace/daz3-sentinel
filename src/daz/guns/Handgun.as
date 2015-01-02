package daz.guns
{
	
	import daz.world.Pickup;
	
	
	public class Handgun extends BulletGun
	{
		
		public function Handgun()
		{
			_damage = 2;
			_cooldownDelay = 32;
			_reloadDelay = 50;
			_clipSize = 8;
			_clipAmmo = 8;
			_totalAmmo = 32;
			_offset = 30;
			_errorAngle = 0.1;
			
			super(Pickup.HANDGUN, Pickup.HANDGUN_AMMO);
		}
		
	}
	
}