package guns
{
	
	import scene.Creature;
	import sentinel.framework.Data;
	import sentinel.framework.IStorable;
	import sentinel.gameplay.world.World;
	
	
	public class Gun implements IStorable
	{
		
		private var _name:String;
		private var _ammoName:String;
		private var _reloadTimer:int = 0;
		private var _cooldownTimer:int = 0;
		
		protected var _damage:int = 0;
		protected var _totalAmmo:int = 0;
		protected var _clipAmmo:int = 0;
		protected var _clipSize:int = 0;
		protected var _reloadDelay:int = 0;
		protected var _cooldownDelay:int = 0;
		protected var _errorAngle:Number = 0.1;
		
		// TODO: Weapon levels.
		// ...
		
		
		public function Gun(name:String, ammoName:String)
		{
			_name = name;
			_ammoName = ammoName;
		}
		
		
		public function save():Data
		{
			return super.save().merge({
				//
			});
		}
		
		
		public function load(data:Data):void
		{
			super.load(data);
			
			//
		}
		
		
		public function update():void
		{
			if (_reloadTimer > 0)
			{
				_reloadTimer -= 1;
				
				if(_reloadTimer === 0) _reload();
			}
			else
			{
				if (_cooldownTimer > 0)
				{
					_cooldownTimer -= 1;
				}
			}
		}
		
		
		public function attemptFire(user:Creature, world:World):void
		{
			if (_reloadTimer === 0 && _cooldownTimer === 0)
			{
				_cooldownTimer = _cooldownDelay;
				
				if (_clipAmmo <= 0)
				{
					attemptReload();
				}
				else
				{
					_clipAmmo -= 1;
					fire(user, world);
				}
			}
		}
		
		
		public function attemptReload():void
		{
			if(_clipAmmo < _clipSize && _reloadTimer === 0)
			{
				_reloadTimer = _reloadDelay;
			}
		}
		
		
		private function _reload():void
		{
			var required:int = _clipSize - _clipAmmo;
			
			if (_totalAmmo <= required)
			{
				_clipAmmo = _totalAmmo;
				_totalAmmo = 0;
			}
			else
			{
				_totalAmmo -= required;
				_clipAmmo = _clipSize;
			}
		}
		
		
		protected function fire(user:Creature, world:World):void
		{
			// Fire this weapon.
			//
		}
		
		
		public function addAmmo(amount:int):void
		{
			_totalAmmo += amount;
		}
		
		
		public function get name():String { return _name; }
		public function get ammoName():String { return _ammoName; }
		public function get clipSize():int { return _clipSize; }
		public function get clipAmmo():int { return _clipAmmo; }
		public function get totalAmmo():int { return _totalAmmo; }
		
	}
	
}