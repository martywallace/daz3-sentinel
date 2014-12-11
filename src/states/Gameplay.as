package states
{
	
	import scene.DAZMap;
	import scene.DAZWorld;
	import sentinel.gameplay.states.GameplayState;
	import ui.HUD;
	
	
	public class Gameplay extends GameplayState
	{
		
		public function Gameplay()
		{
			var world:DAZWorld = new DAZWorld(true);
			var hud:HUD = new HUD();
			
			super(world, hud);
			
			
			world.loadMap(new DAZMap());
		}
		
		
		protected override function get backgroundColor():uint { return 0x000000; }
		
	}
	
}