package daz.world
{
	
	import daz.events.HeroEvent;
	import daz.guns.Gun;
	import daz.world.services.Inventory;
	import flash.geom.Point;
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
	import sentinel.gameplay.world.BeingService;
	import sentinel.gameplay.world.IUnique;
	import starling.display.DisplayObject;
	
	
	public class Hero extends Creature implements IUnique
	{
		
		private var _gunGraphics:Image;
		private var _shooting:Boolean = false;
		
		
		public function Hero()
		{
			super();
			
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
			if (pickup.isAmmo || pickup.isGun)
			{
				inventory.add(pickup);
			}
			else
			{
				// Utility types (healthpack, etc).
				if (pickup.type === Pickup.HEALTHPACK)
				{
					heal(pickup.value);
				}
			}
		}
		
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Sprite = new Sprite();
			var hero:Image = library.getImageFromSheet('all', 'hero');
			hero.alignPivot();
			
			graphics.depth = World.DEPTH_CREATURES;
			
			_gunGraphics = library.getImageFromSheet('guns', inventory.currentGun.name);
			_gunGraphics.alignPivot();
			_gunGraphics.x = 23;
			
			graphics.addChild(hero);
			graphics.addChild(_gunGraphics);
			
			return graphics;
		}
		
		
		protected override function defineBody(engine:Engine):Body
		{
			var body:Body = engine.createBody(Body.DYNAMIC, this);
			
			body.createFixture(new Circle(20), new FixtureDef(12));
			body.fixedRotation = true;
			body.linearDamping = 12;
			
			return body;
		}
		
		
		protected override function defineServices():Vector.<BeingService>
		{
			return new <BeingService>[new Inventory()];
		}
		
		
		protected override function defineSpeed():Number { return 275; }
		protected override function defineHealth():int { return 250; }
		
		
		protected override function update():void
		{
			if (inventory.currentGun !== null)
			{
				inventory.currentGun.step();
				
				if (_shooting) inventory.currentGun.attemptFire(this, world);
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
			
			var mousePosition:Point = game.mouse.getPositionIn(world);
			rotation = position.angleToCoords(mousePosition.x, mousePosition.y);
			
			super.update();
		}
		
		
		private function _keyboard(event:KeyboardEvent):void
		{
			if (event.keyCode === Keyboard.E)
			{
				inventory.next();
				
				_gunGraphics = _gunGraphics.replace(library.getImageFromSheet('guns', inventory.currentGun.name))
				_gunGraphics.alignPivot();
				
				dispatchEvent(new HeroEvent(HeroEvent.EQUIP_WEAPON));
			}
			
			if (event.keyCode === Keyboard.R)
			{
				inventory.currentGun.attemptReload();
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
		
		
		public function get inventory():Inventory { return getService('inventory') as Inventory; }
		
	}
	
}