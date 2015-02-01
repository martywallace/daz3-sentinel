package daz.states
{
	
	import sentinel.testing.states.TestMenu;
	import sentinel.testing.ui.TestMenuButton;
	
	
	public class Menu extends TestMenu
	{
		
		private static const BUTTON_TEXT_PLAY:String = 'Play';
		
		
		public function Menu()
		{
			super();
			
			setButtons(new <TestMenuButton>[
				new TestMenuButton(BUTTON_TEXT_PLAY, _buttonClick)
			]);
		}
		
		
		private function _buttonClick(button:TestMenuButton):void
		{
			if (button.text === BUTTON_TEXT_PLAY)
			{
				if (storage.load('levelsUnlocked') === null)
				{
					// Starting a new game.
					game.loadState(new Gameplay());
				}
				else
				{
					// Give the player a choice of previously unlocked level.
					game.loadState(new LevelPicker());
				}
			}
		}
		
		
		protected override function get backgroundColor():uint { return 0x000000; }
		
	}
	
}