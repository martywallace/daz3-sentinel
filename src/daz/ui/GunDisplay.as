package daz.ui
{
	
	import daz.events.HeroEvent;
	import daz.guns.Gun;
	import daz.world.World;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Image;
	import sentinel.framework.graphics.Quad;
	import sentinel.framework.graphics.Sprite;
	import sentinel.framework.graphics.TextField;
	import sentinel.framework.util.Align;
	import sentinel.gameplay.ui.BaseUI;
	import sentinel.gameplay.ui.UIElement;
	import starling.display.DisplayObject;
	
	
	public class GunDisplay extends UIElement
	{
		
		private var _gunGraphic:Image;
		private var _ammoDisplay:Sprite;
		private var _bullets:Vector.<Quad>;
		private var _ammoCounter:TextField;
		private var _darkCounter:TextField;
		
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Sprite = new Sprite(true);
			
			var corner:Image = library.getImageFromAtlas('misc', 'hudCorner');
			corner.alignPivot(Align.RIGHT, Align.BOTTOM);
			corner.alpha = 0.7;
			
			_ammoCounter = new TextField(100, 60, '0', 'Verdana', 20, 0xFFFFFF, true);
			_ammoCounter.hAlign = Align.RIGHT;
			_ammoCounter.vAlign = Align.BOTTOM;
			_ammoCounter.alignPivot(Align.RIGHT, Align.BOTTOM);
			_ammoCounter.x = -10;
			_ammoCounter.y = -24;
			_ammoCounter.depth = 2;
			
			_darkCounter = new TextField(100, 60, '0', 'Verdana', 20, 0x000000, true);
			_darkCounter.hAlign = _ammoCounter.hAlign;
			_darkCounter.vAlign = _ammoCounter.vAlign;
			_darkCounter.alignPivot(Align.RIGHT, Align.BOTTOM);
			_darkCounter.x = _ammoCounter.x + 2;
			_darkCounter.y = _ammoCounter.y + 2;
			_darkCounter.depth = 1;
			
			graphics.addChild(corner);
			graphics.addChild(_darkCounter);
			graphics.addChild(_ammoCounter);
			
			return graphics;
		}
		
		
		protected override function added(ui:BaseUI):void
		{
			// Automatically gets removed when the Hero deconstructs.
			(world as World).hero.addEventListener(HeroEvent.EQUIP_WEAPON, _heroChangedGun);
			_setGun((world as World).hero.inventory.currentGun);
		}
		
		
		private function _heroChangedGun(event:HeroEvent):void
		{
			_setGun(event.hero.inventory.currentGun);
		}
		
		
		private function _setGun(gun:Gun):void
		{
			if (_gunGraphic !== null) _gunGraphic.deconstruct();
			if (_ammoDisplay !== null) _ammoDisplay.deconstruct();
			
			_gunGraphic = library.getImageFromAtlas('hudWeapons', gun.name);
			_ammoDisplay = new Sprite();
			
			(graphics as Sprite).addChild(_gunGraphic as DisplayObject);
			(graphics as Sprite).addChild(_ammoDisplay as DisplayObject);
			
			_gunGraphic.alignPivot(Align.RIGHT, Align.BOTTOM);
			_gunGraphic.x = 5;
			_gunGraphic.y = 20;
			_gunGraphic.rotation = 0.1
			
			_bullets = new <Quad>[];
			
			for (var i:int = 0; i < gun.clipSize; i++)
			{
				var bullet:Quad = new Quad(4, 10, 0x111111);
				bullet.x -= i * 5;
				
				_bullets.push(bullet);
				_ammoDisplay.addChild(bullet);
			}
			
			_ammoDisplay.x = -100;
			_ammoDisplay.y = -20;
		}
		
		
		protected override function update():void
		{
			var index:int = 0;
			for each(var bullet:Quad in _bullets)
			{
				if (index++ < (world as World).hero.inventory.currentGun.clipAmmo)
				{
					bullet.color = 0xFFCC00;
				}
				else
				{
					bullet.color = 0x111111;
				}
			}
			
			_ammoCounter.text = (world as World).hero.inventory.currentGun.totalAmmo.toString();
			_darkCounter.text = _ammoCounter.text;
		}
		
	}
	
}