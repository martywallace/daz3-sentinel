package events
{
	
	import scene.Creature;
	import starling.events.Event;
	import sentinel.framework.util.ObjectUtil;
	
	
	// TODO: Make sentinel.events.Event class instead.
	public class CreatureEvent extends Event
	{
		
		public static const DIE:String = 'died';
		public static const TAKE_DAMAGE:String = 'takeDamage';
		
		
		private var _data:Object;
		
		
		public function CreatureEvent(type:String, data:Object = null)
		{
			_data = data;
			
			super(type);
		}
		
		
		public function get creature():Creature { return target as Creature; }
		public function get damageTaken():int { return ObjectUtil.prop(_data, 'damageTaken', 0); }
		
	}
	
}