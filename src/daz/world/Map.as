package daz.world
{
	
	import daz.events.CreatureEvent;
	import daz.world.enemies.Enemy;
	import flash.geom.Point;
	import sentinel.framework.util.Random;
	import sentinel.gameplay.world.Being;
	import sentinel.gameplay.world.BoundaryBox;
	import sentinel.gameplay.world.BaseMap;
	
	
	public class Map extends BaseMap
	{
		
		protected override function construct():void
		{
			_addBoundary();
			_addBackground();
			_addHero();
			_addTrees();
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
			return (world as World).hero;
		}
		
	}
	
}