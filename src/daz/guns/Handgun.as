package daz.guns
{
	
	import daz.world.Pickup;
	
	
	public class Handgun extends BulletGun
	{
		
		protected override function defineName():String { return Pickup.HANDGUN; }
		protected override function defineAmmoName():String { return Pickup.HANDGUN_AMMO; }
		
		protected override function defineDamage():int { return 2; }
		protected override function defineCooldownDelay():int { return 32; }
		protected override function defineReloadDelay():int { return 50; }
		protected override function defineClipSize():int { return 8; }
		protected override function defineTotalAmmo():int { return 32; }
		protected override function defineOffset():Number { return 30; }
		protected override function defineErrorAngle():Number { return 0.1; }
		
		protected override function defineShotSound():String { return 'handgunShotSound'; }
		
	}
	
}