package daz.world.services
{
	
	import daz.ui.EnemyHealthbar;
	import daz.world.enemies.Enemy;
	import sentinel.gameplay.world.WorldService;
	
	
	public class HealthbarService extends WorldService
	{
		
		protected override function construct():void
		{
			//
		}
		
		
		public function make(forEnemy:Enemy):EnemyHealthbar
		{
			return world.add(new EnemyHealthbar(forEnemy)) as EnemyHealthbar;
		}
		
		
		public function remove(fromEnemy:Enemy):void
		{
			//
		}
		
		
		public override function get name():String { return 'healthbarService'; }
		
	}
	
}