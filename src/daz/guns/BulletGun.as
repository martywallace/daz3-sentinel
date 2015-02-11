package daz.guns
{
	
	import daz.world.Creature;
	import daz.world.enemies.Enemy;
	import daz.world.Projectile;
	import daz.world.Tree;
	import sentinel.framework.util.Random;
	import sentinel.gameplay.physics.Vector2D;
	import sentinel.gameplay.world.BaseWorld;
	import sentinel.gameplay.world.WorldQuery;
	import sentinel.gameplay.world.WorldQueryResult;
	
	
	/**
	 * A gun that fires normal bullets.
	 * @author Marty Wallace.
	 */
	public class BulletGun extends Gun
	{
		
		/**
		 * Fire a single bullet - a line cast from the player which damages the first Creature that
		 * it intersects.
		 * @param from The location to shoot from.
		 * @param angle The angle to shoot at.
		 * @param world The World that the bullet is being fired in.
		 */
		protected function fireBullet(from:Vector2D, angle:Number, world:BaseWorld):void
		{
			var projectile:Projectile;
			
			var error:Number = Random.between(-errorAngle, errorAngle);
			var to:Vector2D = from.cast(angle + error, 500);
			var qr:Vector.<WorldQueryResult> = world.query(WorldQuery.create().line(from, to).limit(1));
			
			if (qr.length > 0)
			{
				for each(var result:WorldQueryResult in qr)
				{
					if (result.being is Enemy)
					{
						(result.being as Enemy).takeDamage(damage);
					}
				}
				
				projectile = new Projectile(from, qr[0].point);
			}
			else
			{
				projectile = new Projectile(from, to);
			}
			
			if (projectile !== null)
			{
				world.add(projectile);
			}
		}
		
		
		protected function defineShotSound():String
		{
			return null;
		}
		
		
		/**
		 * Adds <code>fireBullet()</code> as the default behaviour of a BulletGun being fired.
		 * @param user The user of the Gun.
		 * @param world The world that the Gun is being fired in.
		 */
		protected override function fire(user:Creature, world:BaseWorld):void
		{
			fireBullet(user.position.cast(user.rotation, offset), user.rotation, world);
			
			if (defineShotSound() !== null)
			{
				audio.sfx.play('handgunShotSound');
			}
		}
		
	}
	
}