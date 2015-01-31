package daz.world.services
{
	
	import daz.guns.Handgun;
	import daz.guns.Machinegun;
	import daz.guns.Shotgun;
	import sentinel.gameplay.world.BeingService;
	import daz.guns.Gun;
	import daz.world.Pickup;
	
	
	public class Inventory extends BeingService
	{
		
		private var _guns:Vector.<Gun>;
		
		
		protected override function construct():void
		{
			_guns = new <Gun>[new Handgun(), new Machinegun(), new Shotgun()];
		}
		
		
		public function get guns():Vector.<Gun>
		{
			return _guns;
		}
		
		
		public override function get name():String
		{
			return 'inventory';
		}
		
	}
	
}