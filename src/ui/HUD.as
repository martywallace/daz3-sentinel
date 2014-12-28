package ui
{
	
	import sentinel.gameplay.ui.UI;
	
	
	public class HUD extends UI
	{
		
		private var _healthbar:Healthbar;
		private var _counter:KillCounter;
		
		
		public function HUD()
		{
			super();
			
			_healthbar = new Healthbar();
			_counter = new KillCounter();
			
			add(_healthbar);
			add(_counter);
			
			_healthbar.x = viewport.width - _healthbar.graphics.width - 10;
			_healthbar.y = viewport.height - _healthbar.graphics.height - 10;
			
			_counter.x = viewport.center.x;
			_counter.y = 35;
		}
		
	}
	
}