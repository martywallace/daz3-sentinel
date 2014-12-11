package scene
{
	
	import sentinel.framework.client.Keyboard;
	import sentinel.framework.client.KeyboardState;
	import sentinel.framework.graphics.IGraphics;
	import sentinel.gameplay.physics.Body;
	import sentinel.gameplay.physics.Circle;
	import sentinel.gameplay.physics.Engine;
	import sentinel.gameplay.physics.FixtureDef;
	import sentinel.gameplay.scene.IUnique;
	
	
	public class Hero extends Creature implements IUnique
	{
		
		private var _speed:Number = 160;
		
		
		protected override function defineGraphics():IGraphics
		{
			return null;
		}
		
		
		protected override function defineBody(engine:Engine):Body
		{
			var body:Body = engine.createBody(Body.DYNAMIC, this);
			body.createFixture(new Circle(25), new FixtureDef(1));
			
			body.linearDamping = 12;
			
			return body;
		}
		
		
		protected override function defineHealth():int
		{
			return 100;
		}
		
		
		protected override function update():void
		{
			var kbd:KeyboardState = keyboard.getState();
			
			if (kbd.isDown(Keyboard.A)) body.linearVelocityX = -_speed;
			if (kbd.isDown(Keyboard.D)) body.linearVelocityX = _speed;
			if (kbd.isDown(Keyboard.W)) body.linearVelocityY = -_speed;
			if (kbd.isDown(Keyboard.S)) body.linearVelocityY = _speed;
			
			super.update();
		}
		
		
		public function get uniqueName():String
		{
			return 'Hero';
		}
		
	}
	
}