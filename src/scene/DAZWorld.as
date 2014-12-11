package scene
{
	
	import sentinel.gameplay.physics.Debug;
	import sentinel.gameplay.physics.EngineDef;
	import sentinel.gameplay.scene.World;
	
	
	public class DAZWorld extends World
	{
		
		public function DAZWorld(debugPhysics:Boolean = false)
		{
			super(new EngineDef(), debugPhysics ? new Debug(game) : null);
		}
		
	}
	
}