package daz.guns
{
	
	import daz.world.Pickup;
	
	
	public class Machinegun extends BulletGun
	{
		
		protected override function defineName():String { return Pickup.MACHINEGUN; }
		protected override function defineAmmoName():String { return Pickup.MACHINEGUN_AMMO; }
		
		protected override function defineDamage():int { return 1; }
		protected override function defineCooldownDelay():int { return 8; }
		protected override function defineReloadDelay():int { return 75; }
		protected override function defineClipSize():int { return 24; }
		protected override function defineTotalAmmo():int { return 24; }
		protected override function defineOffset():Number { return 50; }
		protected override function defineErrorAngle():Number { return 0.15; }
		
	}
	
}