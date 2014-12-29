package ui 
{
	
	import scene.DAZWorld;
	import scene.Hero;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Quad;
	import sentinel.framework.graphics.Sprite;
	import sentinel.gameplay.ui.UIElement;
	
	
	public class Healthbar extends UIElement
	{
		
		private var _background:Quad;
		private var _fill:Quad;
		
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Sprite = new Sprite();
			
			_background = new Quad(80, 10, 0x111111);
			_fill = new Quad(80, 10, 0xCC1111);
			
			graphics.addChild(_background);
			graphics.addChild(_fill);
			
			return graphics;
		}
		
		
		protected override function update():void
		{
			var hero:Hero = (world as DAZWorld).hero;
			
			if (hero !== null)
			{
				_fill.scaleX = hero.healthPercent;
			}
		}
		
	}

}