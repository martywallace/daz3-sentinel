package ui
{
	
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Image;
	import sentinel.framework.graphics.Sprite;
	import sentinel.gameplay.ui.UIElement;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	
	public class GunDisplay extends UIElement
	{
		
		private var _gunGraphic:Image;
		private var _ammoDisplay:Sprite;
		
		
		protected override function defineGraphics():IGraphics
		{
			_gunGraphic = library.getImageFromAtlas('hudWeapons', 'handgun');
			_ammoDisplay = new Sprite();
			
			var graphics:Sprite = new Sprite();
			
			graphics.addChild(_gunGraphic);
			graphics.addChild(_ammoDisplay);
			
			_gunGraphic.alignPivot(HAlign.RIGHT, VAlign.BOTTOM);
			_gunGraphic.x = 5;
			_gunGraphic.y = 20;
			_gunGraphic.rotation = 0.1;
			
			return graphics;
		}
		
	}
	
}