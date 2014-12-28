package scene
{
	
	import flash.geom.Point;
	import sentinel.gameplay.physics.Vector2D;
	import sentinel.gameplay.world.BoundaryBox;
	import sentinel.gameplay.world.Map;
	import sentinel.framework.util.Random;
	import events.CreatureEvent;
	
	
	public class DAZMap extends Map
	{
		
		private var _enemies:int = 0;
		private var _maxEnemies:int = 4;
		private var _remaining:int = 12;
		private var _round:int = 1;
		
		
		protected override function construct():void
		{
			_addBoundary();
			_addBackground();
			_addHero();
			_addTrees();
		}
		
		
		protected override function update():void
		{
			if (_enemies < _maxEnemies)
			{
				_enemies ++;
				
				var zombie:Zombie = new Zombie();
				var position:Point = Random.inRing(hero.position.x, hero.position.y, 600, 700);
				
				while (position.x < 1010 - 1100 / 2 || position.y < 1010 - 1500 / 2 || position.x > 1010 + 1100 / 2 || position.y > 1010 + 1500 / 2)
				{
					// Don't place Zombies out of bounds.
					position = Random.inRing(hero.position.x, hero.position.y, 600, 700);
				}
				
				zombie.moveTo(position.x, position.y);
				zombie.addEventListener(CreatureEvent.DIE, _creatureDied);
				
				add(zombie);
			}
		}
		
		
		private function _creatureDied(event:CreatureEvent):void
		{
			_enemies -= 1;
			_remaining -= 1;
			
			if (_remaining <= 0)
			{
				_round += 1;
				_remaining = 12 + (_round * 2.5);
				_maxEnemies = 4 + (_round * 1.5);
			}
		}
		
		
		private function _addBoundary():void
		{
			var boundary:BoundaryBox = new BoundaryBox(1100, 1500);
			
			boundary.moveTo(1010, 1010);
			add(boundary);
		}
		
		
		private function _addBackground():void
		{
			var background:Background = new Background();
			add(background);
		}
		
		
		private function _addHero():void
		{
			var hero:Hero = new Hero();
			
			hero.moveTo(1010, 1010);
			
			add(hero);
		}
		
		
		private function _addTrees():void
		{
			for (var i:int = 0; i < 10; i++)
			{
				var tree:Tree = new Tree();
				var position:Point = Random.inRectangle(0, 0, 2020, 2020);
				
				tree.moveTo(position.x, position.y);
				
				add(tree);
			}
		}
		
		
		public function get hero():Hero
		{
			return (world as DAZWorld).hero;
		}
		
		
		public function get remaining():int { return _remaining; }
		
	}
	
}