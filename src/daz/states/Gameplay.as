package daz.states
{
	
	import daz.Game;
	import daz.events.CreatureEvent;
	import daz.ui.HUD;
	import daz.world.Map;
	import daz.world.World;
	import sentinel.testing.states.TestGameplay;
	
	
	public class Gameplay extends TestGameplay
	{
		
		public function Gameplay()
		{
			var world:World = new World(Game.DEBUG_PHYSICS);
			world.loadMap(new Map());
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