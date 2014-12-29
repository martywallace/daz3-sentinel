package scene
{
	
	import events.HeroEvent;
	import guns.Gun;
	import guns.Handgun;
	import guns.Machinegun;
	import sentinel.framework.client.Keyboard;
	import sentinel.framework.client.KeyboardState;
	import sentinel.framework.events.KeyboardEvent;
	import sentinel.framework.events.MouseEvent;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.IGraphicsContainer;
	import sentinel.framework.graphics.Image;
	import sentinel.framework.graphics.Sprite;
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Circle;
	import sentinel.gameplay.physics.Engine;
	import sentinel.gameplay.physics.FixtureDef;
	import sentinel.gameplay.util.Compass;
	import sentinel.gameplay.world.IUnique;
	import starling.display.DisplayObject;
	
	
	public class Hero extends Creature implements IUnique
	{
		
		private var _currentGunIndex:int = 0;
		private var _guns:Vector.<Gun>;
		private var _gunGraphics:Image;
		private var _shooting:Boolean = false;
		
		
		public function Hero()
		{
			_guns = new <Gun>[new Handgun(), new Machinegun()];
			
			mouse.addEventListener(MouseEvent.LEFT_DOWN, _gun);
			mouse.addEventListener(MouseEvent.LEFT_UP, _gun);
			
			keyboard.addEventListener(KeyboardEvent.KEY_PRESSED, _keyboard);
		}
		
		
		public override function deconstruct():void
		{
			mouse.removeEventListener(MouseEvent.LEFT_DOWN, _gun);
			mouse.removeEventListener(MouseEvent.LEFT_UP, _gun);
			
			keyboard.removeEventListener(KeyboardEvent.KEY_PRESSED, _keyboard);
			
			super.deconstruct();
		}
		
		
		public function pickup(pickup:Pickup):void
		{
			if (pickup.isAmmo)
			{
				for each(var gun:Gun in _guns)
				{
					if (gun.ammoName === pickup.type)
					{
						gun.addAmmo(pickup.value);
					}
				}
			}
			
			if (pickup.type === Pickup.HEALTHPACK)
			{
				heal(pickup.value);
			}
		}
		
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Sprite = new Sprite();
			var hero:Image = library.getImage('hero');
			hero.alignPivot();
			
			graphics.depth = DAZWorld.DEPTH_CREATURES;
			
			_gunGraphics = library.getImageFromAtlas('guns', gun.name);
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
			return 250;
		}
		
		
		protected override function update():void
		{
			if (gun !== null)
			{
				gun.update();
				
				if (_shooting) gun.attemptFire(this, world);
			}
			
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
		
		
		private function _keyboard(event:KeyboardEvent):void
		{
			if (event.keyCode === Keyboard.E)
			{
				if (_guns.length === 1)
				{
					// Only have one weapon.
					return;
				}
				
				_currentGunIndex = _currentGunIndex >= _guns.length - 1 ? 0 : _currentGunIndex + 1;
				
				if (_gunGraphics !== null)
				{
					_gunGraphics.deconstruct();
					_gunGraphics = library.getImageFromAtlas('guns', gun.name);
					
					_gunGraphics.alignPivot();
					_gunGraphics.x = 23;
					
					(graphics as IGraphicsContainer).addChild(_gunGraphics as DisplayObject);
				}
				
				dispatchEvent(new HeroEvent(HeroEvent.EQUIP_WEAPON));
			}
			
			if (event.keyCode === Keyboard.R)
			{
				gun.attemptReload();
			}
		}
		
		
		private function _gun(event:MouseEvent):void
		{
			_shooting = event.type === MouseEvent.LEFT_DOWN;
		}
		
		
		public function get uniqueName():String
		{
			return 'Hero';
		}
		
		
		public function get gun():Gun { return _guns[_currentGunIndex]; }
		
	}
	
}