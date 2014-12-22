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
			var world:DAZWorld = new DAZWorld(true);
			var hud:HUD = new HUD();
			
			super(world, hud);
			
			
			world.loadMap(new DAZMap());
			
			world.hero.addEventListener(CreatureEvent.DIE, _heroDied);
		}
		
		
		private function _heroDied(event:CreatureEvent):void
		{
			// The hero died, back to the Main menu for now.
			game.loadState(new Menu());
		}
		
		
		protected override function get backgroundColor():uint { return 0x000000; }
		
	}
	
}