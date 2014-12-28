package scene
{
	
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Image;
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Box;
	import sentinel.gameplay.physics.Engine;
	import sentinel.gameplay.physics.Fixture;
	import sentinel.gameplay.world.Being;
	import sentinel.gameplay.events.ContactEvent;
	
	
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
		
		
		private var _type:String;
		
		
		public function Pickup(type:String)
		{
			super();
			
			_type = type;
		}
		
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Image = library.getImageFromAtlas('pickups', _type);
			
			graphics.depth = DAZWorld.DEPTH_PICKUPS;
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
		
		
		private function _touchHero(event:ContactEvent):void
		{
			if (event.externalOwner === world.getUnique('Hero'))
			{
				(world.getUnique('Hero') as Hero).pickup(this);
				deconstruct();
			}
		}
		
		
		public function get type():String { return _type; }
		
	}
	
}