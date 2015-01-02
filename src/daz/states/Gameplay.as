package daz.states
{
	
	import daz.DAZ3;
	import daz.events.CreatureEvent;
	import daz.ui.HUD;
	import daz.world.DAZMap;
	import daz.world.DAZWorld;
	import sentinel.testing.states.TestGameplay;
	
	
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