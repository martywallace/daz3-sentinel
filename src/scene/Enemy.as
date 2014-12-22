package scene 
{
	
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
			
			deconstruct();
		}
		
		
		protected function attack():void
		{
			// Override and define attack mechanism.
			// ...
		}
		
	}

}