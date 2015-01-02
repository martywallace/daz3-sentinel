package daz.events
{
	
	import daz.world.Hero;
	import sentinel.framework.events.Event;
	
	
	public class HeroEvent extends Event
	{
		
		public static const EQUIP_WEAPON:String = 'equipWeapon';
		
		
		public function HeroEvent(type:String)
		{
			super(type);
		}
		
		
		public function get hero():Hero { return target as Hero; }
		
	}
	
}