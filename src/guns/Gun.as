package guns
{
	
	import scene.Creature;
	import sentinel.framework.Data;
	import sentinel.framework.Thing;
	import sentinel.gameplay.world.World;
	
	
	public class Gun extends Thing
	{
		
		private var _name:String;
		private var _ammoName:String;
		private var _reloadTimer:int;
		
		protected var _damage:int;
		protected var _totalAmmo:int;
		protected var _clipAmmo:int;
		protected var _clipSize:int;
		protected var _reloadDelay:int;
		
		// TODO: Weapon levels.
		// ...
		
		
		public function Gun(name:String, ammoName:String)
		{
			_name = name;
			_ammoName = ammoName;
		}
		
		
		public override function save():Data
		{
			return super.save().merge({
				//
			});
		}
		
		
		public override function load(data:Data):void
		{
			super.load(data);
			
			//
		}
		
		
		public function attemptFire(user:Creature, world:World):void
		{
			// TOOD: Check ammo, cooldown.
			// ...
			
			fire(user, world);
		}
		
		
		protected function fire(user:Creature, world:World):void
		{
			//
		}
		
	}
	
}