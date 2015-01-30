package daz.guns
{
	
	import daz.world.Creature;
	import daz.world.Pickup;
	import sentinel.gameplay.world.BaseWorld;
	
	
	public class Shotgun extends BulletGun
	{
		
		protected override function defineName():String { return Pickup.SHOTGUN; }
		protected override function defineAmmoName():String { return Pickup.SHOTGUN_AMMO; }
		
		protected override function defineDamage():int { return 1; }
		protected override function defineCooldownDelay():int { return 50; }
		protected override function defineReloadDelay():int { return 120; }
		protected override function defineClipSize():int { return 4; }
		protected override function defineTotalAmmo():int { return 4; }
		protected override function defineOffset():Number { return 50; }
		protected override function defineErrorAngle():Number { return 0.22; }
		
		
		protected override function fire(user:Creature, world:BaseWorld):void
		{
			for (var i:int = 0; i < 8; i++)
			{
				fireBullet(user.position.cast(user.rotation, offset), user.rotation, world);
			}
		}
		
	}
	
}