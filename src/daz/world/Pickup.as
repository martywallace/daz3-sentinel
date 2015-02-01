package daz.world
{
	
	import daz.guns.Gun;
	import daz.guns.Handgun;
	import daz.guns.Machinegun;
	import daz.guns.Shotgun;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Image;
	import sentinel.framework.util.Random;
	import sentinel.gameplay.events.ContactEvent;
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Box;
	import sentinel.gameplay.physics.Engine;
	import sentinel.gameplay.physics.Fixture;
	import sentinel.gameplay.world.Being;
	
	
	public class Pickup extends Being
	{
		
		public static const HANDGUN:String = 'handgun';
		public static const HANDGUN_AMMO:String = 'handgunAmmo';
		public static const MACHINEGUN:String = 'machinegun';
		public static const MACHINEGUN_AMMO:String = 'machinegunAmmo';
		public static const SHOTGUN:String = 'shotgun';
		public static const SHOTGUN_AMMO:String = 'shotgunAmmo';
		public static const REVOLVER:String = 'revolver';
		public static const REVOLVER_AMMO:String = 'revolverAmmo';
		public static const ROCKET_LAUNCHER:String = 'rocketLauncher';
		public static const ROCKET_LAUNCHER_AMMO:String = 'rocketLauncherAmmo';
		public static const LASERGUN:String = 'lasergun';
		public static const LASERGUN_AMMO:String = 'lasergunAmmo';
		public static const HEALTHPACK:String = 'healthpack';
		
		private static const GUN_TYPES:Array = [HANDGUN, MACHINEGUN, SHOTGUN, REVOLVER, ROCKET_LAUNCHER, LASERGUN];
		private static const AMMO_TYPES:Array = [HANDGUN_AMMO, MACHINEGUN_AMMO, SHOTGUN_AMMO, ROCKET_LAUNCHER_AMMO, LASERGUN_AMMO];
		private static const UTILITY_TYPES:Array = [HEALTHPACK];
		
		
		public static function toGun(type:String):String
		{
			return type.replace('Ammo', '');
		}
		
		
		public static function toAmmo(type:String):String
		{
			return type.indexOf('Ammo') >= 0 ? type : type + 'Ammo';
		}
		
		
		private var _type:String;
		
		
		public function Pickup(type:String)
		{
			super();
			
			_type = type;
		}
		
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Image = library.getImageFromAtlas('pickups', _type);
			
			graphics.depth = World.DEPTH_PICKUPS;
			graphics.alignPivot();
			
			return graphics;
		}
		
		
		protected override function defineBody(engine:Engine):Body
		{
			var body:Body = engine.createBody(Body.DYNAMIC, this);
			var fixture:Fixture = body.createFixture(new Box(graphics.width, graphics.height));
			
			fixture.isSensor = true;
			
			body.angularDamping = 5;
			body.linearDamping = 5;
			body.addEventListener(ContactEvent.BEGIN, _touchHero);
			
			return body;
		}
		
		
		public function toNewGun():Gun
		{
			var gun:Gun = null;
			
			switch(_type)
			{
				case HANDGUN: gun = new Handgun(); break;
				case MACHINEGUN: gun = new Machinegun(); break;
				case SHOTGUN: gun = new Shotgun(); break;
			}
			
			return gun;
		}
		
		
		public function convertToGun():void
		{
			_type = toGun(_type);
		}
		
		
		public function convertToAmmo():void
		{
			_type = toAmmo(_type);
		}
		
		
		private function _touchHero(event:ContactEvent):void
		{
			if (event.externalOwner === world.getUnique('Hero'))
			{
				(world.getUnique('Hero') as Hero).pickup(this);
				deconstruct();
			}
		}
		
		
		public function get type():String { return _type; }
		
		
		public function get isAmmo():Boolean { return AMMO_TYPES.indexOf(_type) >= 0; }
		public function get isGun():Boolean { return GUN_TYPES.indexOf(_type) >= 0; }
		public function get isUtility():Boolean { return UTILITY_TYPES.indexOf(_type) >= 0; }
		
		
		public function get value():int
		{
			switch(type)
			{
				default: return 1; break;
				
				case HANDGUN_AMMO: return Random.between(5, 8); break;
				case MACHINEGUN_AMMO: return Random.between(12, 20); break;
				case SHOTGUN_AMMO: return Random.between(2, 5); break;
				case REVOLVER_AMMO: return Random.between(1, 3); break;
				case ROCKET_LAUNCHER_AMMO: return Random.between(1, 2); break;
				case LASERGUN_AMMO: return Random.between(30, 45); break;
				
				case HEALTHPACK: return Random.between(20, 35); break;
			}
			
			return 1;
		}
		
	}
	
}