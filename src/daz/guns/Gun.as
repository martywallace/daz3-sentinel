package daz.guns
{
	
	import daz.world.Creature;
	import sentinel.framework.Data;
	import sentinel.framework.IStorable;
	import sentinel.framework.Thing;
	import sentinel.gameplay.world.BaseWorld;
	
	
	public class Gun extends Thing
	{
		
		private var _reloadTimer:int = 0;
		private var _cooldownTimer:int = 0;
		
		private var _name:String;
		private var _ammoName:String;
		private var _damage:int;
		private var _totalAmmo:int;
		private var _clipAmmo:int;
		private var _clipSize:int;
		private var _reloadDelay:int;
		private var _cooldownDelay:int;
		private var _errorAngle:Number;
		private var _offset:Number;
		
		
		public function Gun()
		{
			super();
			
			_name = defineName();
			_ammoName = defineAmmoName();
			_damage = defineDamage();
			_totalAmmo = defineTotalAmmo();
			_clipAmmo = defineClipAmmo();
			_clipSize = defineClipSize();
			_reloadDelay = defineReloadDelay();
			_cooldownDelay = defineCooldownDelay();
			_errorAngle = defineErrorAngle();
			_offset = defineOffset();
		}
		
		
		protected function defineName():String { return null; }
		protected function defineAmmoName():String { return null; }
		
		protected function defineDamage():int { return 0; }
		protected function defineTotalAmmo():int { return 0; }
		protected function defineClipAmmo():int { return 0; }
		protected function defineClipSize():int { return 0; }
		protected function defineReloadDelay():int { return 0; }
		protected function defineCooldownDelay():int { return 0; }
		protected function defineErrorAngle():Number { return 0; }
		protected function defineOffset():Number { return 0; }
		
		
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
		
		
		/**
		 * TODO: Hmmm...
		 */
		public function step():void
		{
			update();
		}
		
		
		protected override function update():void
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
		
		
		public function attemptFire(user:Creature, world:BaseWorld):void
		{
			if (_reloadTimer === 0 && _cooldownTimer === 0)
			{
				_cooldownTimer = _cooldownDelay;
				
				if(_clipAmmo > 0)
				{
					_clipAmmo -= 1;
					fire(user, world);
				}
				
				if (_clipAmmo <= 0)
				{
					attemptReload();
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
			
			audio.sfx.play('reloadSound');
		}
		
		
		protected function fire(user:Creature, world:BaseWorld):void
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
		public function get damage():int { return _damage; }
		public function get totalAmmo():int { return _totalAmmo; }
		public function get clipAmmo():int { return _clipAmmo; }
		public function get clipSize():int { return _clipSize; }
		public function get reloadDelay():int { return _reloadDelay; }
		public function get cooldownDelay():int { return _cooldownDelay; }
		public function get errorAngle():Number { return _errorAngle; }
		public function get offset():Number { return _offset; }
		
	}
	
}