package ui
{
	
	import scene.DAZMap;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.gameplay.ui.UIElement;
	import sentinel.framework.graphics.Sprite;
	import sentinel.framework.graphics.TextField;
	
	
	public class KillCounter extends UIElement
	{
		
		private var _counter:TextField;
		private var _detail:TextField;
		
		
		protected override function defineGraphics():IGraphics
		{
			_counter = new TextField(200, 30, '0', 'Verdana', 20, 0xFFFFFF);
			_detail = new TextField(200, 30, 'REMAINING', 'Verdana', 10, 0xFFFFFF);
			
			_counter.alignPivot();
			_detail.alignPivot();
			_detail.y = 20;
			
			var graphics:Sprite = new Sprite();
			graphics.addChild(_counter);
			graphics.addChild(_detail);
			
			return graphics;
		}
		
		
		protected override function update():void
		{
			if (world.map !== null)
			{
				_counter.text = (world.map as DAZMap).remaining.toString();
			}
			
			super.update();
		}
		
	}
	
}