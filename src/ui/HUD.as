package ui
{
	
	import sentinel.gameplay.ui.UI;
	
	
	public class HUD extends UI
	{
		
		private var _healthbar:Healthbar;
		private var _counter:KillCounter;
		private var _gunDisplay:GunDisplay;
		
		
		public function HUD()
		{
			super();
			
			_gunDisplay = new GunDisplay();
			_healthbar = new Healthbar();
			_counter = new KillCounter();
			
			add(_gunDisplay);
			add(_healthbar);
			add(_counter);
			
			_gunDisplay.x = viewport.width;
			_gunDisplay.y = viewport.height;
			
			_healthbar.x = viewport.width - _healthbar.graphics.width - 10;
			_healthbar.y = viewport.height - _healthbar.graphics.height - 10;
			
			_counter.x = viewport.center.x;
			_counter.y = 35;
		}
		
	}
	
}