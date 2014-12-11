package scene
{
	
	import sentinel.gameplay.scene.Map;
	
	
	public class DAZMap extends Map
	{
		
		protected override function construct():void
		{
			var hero:Hero = new Hero();
			world.add(hero);
		}
		
	}
	
}