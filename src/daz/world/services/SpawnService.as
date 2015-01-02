package daz.world.services
{
	
	import daz.events.CreatureEvent;
	import daz.world.World;
	import daz.world.enemies.Enemy;
	import daz.world.Hero;
	import flash.geom.Point;
	import sentinel.framework.util.Random;
	import sentinel.gameplay.world.Being;
	import sentinel.gameplay.world.WorldService;
	
	
	public class SpawnService extends WorldService
	{
		
		private var _enemies:int = 0;
		private var _maxEnemies:int = 4;
		private var _remaining:int = 12;
		private var _round:int = 1;
		
		
		protected override function construct():void
		{
			//
		}
		
		
		protected override function update():void
		{
			if (_enemies < _maxEnemies)
			{
				var hero:Hero = (world as World).hero;
				
				_enemies ++;
				
				var enemy:Enemy = Being.create('daz.world.enemies::' + Random.fromArray([
					'Rat', 'Zombie'
				])) as Enemy;
				
				var position:Point = Random.inRing(hero.position.x, hero.position.y, 600, 700);
				
				while (position.x < 1010 - 1100 / 2 || position.y < 1010 - 1500 / 2 || position.x > 1010 + 1100 / 2 || position.y > 1010 + 1500 / 2)
				{
					// Don't place Zombies out of bounds.
					position = Random.inRing(hero.position.x, hero.position.y, 600, 700);
				}
				
				enemy.moveTo(position.x, position.y);
				enemy.addEventListener(CreatureEvent.DIE, _creatureDied);
				
				world.add(enemy);
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
		
		
		public function get remaining():int { return _remaining; }
		public override function get name():String { return 'spawnService'; }
		
	}
	
}