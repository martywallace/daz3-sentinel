package states
{
	
	import scene.DAZMap;
	import scene.DAZWorld;
	import sentinel.testing.states.TestGameplay;
	import events.CreatureEvent;
	import ui.HUD;
	
	
	public class Gameplay extends TestGameplay
	{
		
		public function Gameplay()
		{
			var world:DAZWorld = new DAZWorld(DAZ3.DEBUG_PHYSICS);
			world.loadMap(new DAZMap());
			world.hero.addEventListener(CreatureEvent.DIE, _heroDied);
			
			var hud:HUD = new HUD();
			
			super(world, hud);
		}
		
		
		private function _heroDied(event:CreatureEvent):void
		{
			// The hero died, back to the Main menu for now.
			game.loadState(new Menu());
		}
		
		
		protected override function get backgroundColor():uint { return 0x000000; }
		
	}
	
}