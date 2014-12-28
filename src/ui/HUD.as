package ui
{
	
	import sentinel.gameplay.ui.UI;
	
	
	public class HUD extends UI
	{
		
		private var _healthbar:Healthbar;
		
		
		public function HUD()
		{
			super();
			
			_healthbar = new Healthbar();
			add(_healthbar);
			
			_healthbar.x = viewport.width - _healthbar.graphics.width - 10;
			_healthbar.y = viewport.height - _healthbar.graphics.height - 10;
		}
		
	}
	
}