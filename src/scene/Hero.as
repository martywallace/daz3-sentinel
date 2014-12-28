package scene
{
	
	import guns.Gun;
	import guns.Handgun;
	import sentinel.framework.client.Keyboard;
	import sentinel.framework.client.KeyboardState;
	import sentinel.framework.events.MouseEvent;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Image;
	import sentinel.framework.graphics.MovieClip;
	import sentinel.framework.graphics.Sprite;
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Circle;
	import sentinel.gameplay.physics.Engine;
	import sentinel.gameplay.physics.FixtureDef;
	import sentinel.gameplay.util.Compass;
	import sentinel.gameplay.world.IUnique;
	
	
	public class Hero extends Creature implements IUnique
	{
		
		private var _gun:Gun;
		private var _gunGraphics:MovieClip;
		
		
		public function Hero()
		{
			_gun = new Handgun();
			addT(_gun);
			
			mouse.addEventListener(MouseEvent.LEFT_DOWN, _useGun);
		}
		
		
		public override function deconstruct():void
		{
			mouse.removeEventListener(MouseEvent.LEFT_DOWN, _useGun);
			super.deconstruct();
		}
		
		
		public function pickup(pickup:Pickup):void
		{
			// TODO: Eat pickup.
			// ...
		}
		
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Sprite = new Sprite();
			var hero:Image = library.getImage('hero');
			hero.alignPivot();
			
			graphics.depth = DAZWorld.DEPTH_CREATURES;
			
			_gunGraphics = new MovieClip(library.getTexturesFromAtlas('guns'));
			_gunGraphics.alignPivot();
			_gunGraphics.x = 23;
			
			graphics.addChild(hero);
			graphics.addChild(_gunGraphics);
			
			return graphics;
		}
		
		
		protected override function defineBody(engine:Engine):Body
		{
			var body:Body = engine.createBody(Body.DYNAMIC, this);
			body.createFixture(new Circle(20), new FixtureDef(1));
			
			body.linearDamping = 12;
			
			return body;
		}
		
		
		protected override function defineSpeed():Number
		{
			return 275;
		}
		
		
		protected override function defineHealth():int
		{
			return 10000;
		}
		
		
		protected override function update():void
		{
			var kbd:KeyboardState = keyboard.getState();
			var dir:String = '';
			
			if (kbd.isDown(Keyboard.W)) dir += Compass.NORTH;
			else if (kbd.isDown(Keyboard.S)) dir += Compass.SOUTH;
			
			if (kbd.isDown(Keyboard.A)) dir += Compass.WEST;
			else if (kbd.isDown(Keyboard.D)) dir += Compass.EAST;
			
			if (dir.length !== 0)
			{
				body.linearVelocity = Compass.toVector(dir, speed);
			}
			
			rotation = position.angleTo(game.mouse.getPositionIn(world));
			
			super.update();
		}
		
		
		private function _useGun(event:MouseEvent):void
		{
			if (_gun !== null)
			{
				_gun.attemptFire(this, world);
			}
		}
		
		
		public function get uniqueName():String
		{
			return 'Hero';
		}
		
		
		public function get gun():Gun { return _gun; }
		
	}
	
}