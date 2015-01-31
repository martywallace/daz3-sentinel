package daz.world.services
{
	
	import daz.guns.Handgun;
	import daz.guns.Machinegun;
	import daz.guns.Shotgun;
	import daz.world.Hero;
	import sentinel.gameplay.world.BeingService;
	import daz.guns.Gun;
	import daz.world.Pickup;
	
	
	public class Inventory extends BeingService
	{
		
		private var _currentGunIndex:int = 0;
		private var _guns:Vector.<Gun>;
		
		
		protected override function construct():void
		{
			_guns = new <Gun>[new Handgun(), new Machinegun(), new Shotgun()];
		}
		
		
		public function addAmmo(pickup:Pickup):void
		{
			for each(var gun:Gun in _guns)
			{
				if (gun.ammoName === pickup.type)
				{
					gun.addAmmo(pickup.value);
				}
			}
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