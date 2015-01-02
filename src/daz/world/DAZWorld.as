package daz.world
{
	
	import daz.DAZ3;
	import daz.world.enemies.Rat;
	import daz.world.enemies.Zombie;
	import daz.world.services.PickupService;
	import daz.world.services.SpawnService;
	import sentinel.gameplay.physics.Debug;
	import sentinel.gameplay.physics.EngineDef;
	import sentinel.gameplay.world.World;
	import sentinel.gameplay.world.WorldService;
	
	
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
		}
		
		
		protected override function registerBeingTypes():Vector.<Class>
		{
			return super.registerBeingTypes().concat(new <Class>[Rat, Zombie]);
		}
		
		
		protected override function defineServices():Vector.<WorldService>
		{
			return new <WorldService>[new PickupService(), new SpawnService()];
		}
		
		
		protected override function update():void
		{
			super.update();
			
			camera.lookAt(hero);
		}
		
		
		public function get hero():Hero{ return getUnique('Hero') as Hero; }
		public function get pickupService():PickupService { return getService('pickupService') as PickupService; }
		public function get spawnService():SpawnService { return getService('spawnService') as SpawnService; }
		
	}
	
}