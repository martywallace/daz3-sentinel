package daz.ui
{
	
	import daz.world.World;
	import daz.world.enemies.Enemy;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Quad;
	import sentinel.framework.graphics.Sprite;
	import sentinel.gameplay.world.Being;
	import sentinel.framework.util.Align;
	
	
	public class EnemyHealthbar extends Being
	{
		
		private var _enemy:Enemy;
		private var _fill:Quad;
		private var _timer:int = 90;
		
		
		public function EnemyHealthbar(enemy:Enemy)
		{
			_enemy = enemy;
			
			super();
		}
		
		
		public function show(duration:int = 90):void
		{
			if (graphics)
			{
				_timer = duration;
				graphics.visible = true;
			}
		}
		
		
		public function hide():void
		{
			if (graphics)
			{
				graphics.visible = false;
			}
		}
		
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Sprite = new Sprite();
			graphics.depth = World.DEPTH_OVERLAY;
			
			var base:Quad = new Quad(40, 5, 0x222222);
			_fill = new Quad(40, 5, 0xCC0000);
			
			graphics.addChild(base);
			graphics.addChild(_fill);
			graphics.alignPivot(Align.CENTER, Align.BOTTOM);
			graphics.y = -50;
			
			return graphics;
		}
		
		
		protected override function update():void
		{
			_fill.scaleX = _enemy.healthPercent;
			moveTo(_enemy.x, _enemy.y);
			
			if (--_timer < 0)
			{
				hide();
			}
			
			super.update();
		}
		
		
		public function get enemy():Enemy { return _enemy; }
		
	}
	
}