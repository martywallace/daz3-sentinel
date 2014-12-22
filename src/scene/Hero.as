package scene
{
	
	import sentinel.framework.client.Keyboard;
	import sentinel.framework.client.KeyboardState;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.framework.graphics.Image;
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Circle;
	import sentinel.gameplay.physics.Engine;
	import sentinel.gameplay.physics.FixtureDef;
	import sentinel.gameplay.world.Being;
	import sentinel.gameplay.world.IUnique;
	import sentinel.gameplay.util.Compass;
	import sentinel.framework.events.MouseEvent;
	import sentinel.framework.graphics.Sprite;
	
	
	public class Hero extends Creature implements IUnique
	{
		
		private var _gunGraphics:Image;
		
		
		public function Hero()
		{
			mouse.addEventListener(MouseEvent.LEFT_DOWN, _fire);
		}
		
		
		public override function deconstruct():void
		{
			mouse.removeEventListener(MouseEvent.LEFT_DOWN, _fire);
			
			super.deconstruct();
		}
		
		
		protected override function defineGraphics():IGraphics
		{
			var graphics:Sprite = new Sprite();
			var hero:Image = library.getImage('hero');
			hero.alignPivot();
			
			graphics.depth = DAZWorld.DEPTH_CREATURES;
			
			_gunGraphics = library.getImageFromAtlas('weapons', 'handgun');
			_gunGraphics.alignPivot();
			_gunGraphics.x = 23;
			
			graphics.addChild(hero);
			graphics.addChild(_gunGraphics);
			
			return graphics;
		}
		
		
		protected override function defineBody(engine:Engine):Body
		{
			var body:Body = engine.createBody(Body.DYNAMIC, this);
			body.createFixture(new Circle(25), new FixtureDef(1));
			
			body.linearDamping = 12;
			
			return body;
		}
		
		
		protected override function defineSpeed():Number
		{
			return 275;
		}
		
		
		protected override function defineHealth():int
		{
			return 100;
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
		
		
		private function _fire(event:MouseEvent):void
		{
			var enemies:Vector.<Being> = world.queryLine(position, position.cast(rotation, 500));
			trace(enemies);
			
			for each(var enemy:Being in enemies)
			{
				if (enemy is Enemy)
				{
					(enemy as Enemy).takeDamage(100);
				}
			}
		}
		
		
		public function get uniqueName():String
		{
			return 'Hero';
		}
		
	}
	
}