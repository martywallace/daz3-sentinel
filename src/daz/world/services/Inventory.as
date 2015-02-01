package daz.world.services
{
	
	import daz.guns.Gun;
	import daz.guns.Handgun;
	import daz.guns.Machinegun;
	import daz.guns.Shotgun;
	import daz.world.Hero;
	import daz.world.Pickup;
	import sentinel.gameplay.world.BeingService;
	
	
	public class Inventory extends BeingService
	{
		
		private var _currentGunIndex:int = 0;
		private var _guns:Vector.<Gun>;
		
		
		protected override function construct():void
		{
			_guns = new <Gun>[new Handgun()];
		}
		
		
		public function add(pickup:Pickup):void
		{
			if (pickup.isAmmo || hasGun(pickup.type))
			{
				pickup.convertToAmmo();
				for each(var gun:Gun in _guns)
				{
					if (gun.ammoName === pickup.type)
					{
						gun.addAmmo(pickup.value);
					}
				}
			}
			else
			{
				_guns.push(pickup.toNewGun());
			}
		}
		
		
		public function hasGun(name:String):Boolean
		{
			for each(var gun:Gun in _guns)
			{
				if (gun.name === name)
				{
					return true;
				}
			}
			
			return false;
		}
		
		
		public function next():void
		{
			if (_guns.length > 0)
			{
				_currentGunIndex += 1;
				
				if (_currentGunIndex >= _guns.length)
				{
					_currentGunIndex = 0;
				}
			}
		}
		
		
		public function get currentGun():Gun { return _guns[_currentGunIndex]; }
		public function get hero():Hero { return being as Hero; }
		public override function get name():String { return 'inventory'; }
		
	}
	
}