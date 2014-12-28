package scene
{
	
	import sentinel.gameplay.physics.Debug;
	import sentinel.gameplay.physics.EngineDef;
	import sentinel.gameplay.world.World;
	
	
	public class DAZWorld extends World
	{
		
		public static const DEPTH_BACKGROUND:int = 0;
		public static const DEPTH_PICKUPS:int = 1;
		public static const DEPTH_CREATURES:int = 2;
		public static const DEPTH_NATURE:int = 3;
		public static const DEPTH_PROJECTILES:int = 4;
		
		
		
		public function DAZWorld(debugPhysics:Boolean = false)
		{
			super(new EngineDef(), debugPhysics ? new Debug(game, 1, 1, 0.2, DAZ3.DEBUG_PHYSICS_FEATURES) : null);
			
			//
		}
		
		
		protected override function update():void
		{
			super.update();
			
			camera.lookAt(getUnique('Hero'));
		}
		
		
		public function get hero():Hero
		{
			return getUnique('Hero') as Hero;
		}
		
	}
	
}