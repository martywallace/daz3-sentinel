package
{
	
	import sentinel.framework.Game;
	import states.Menu;
	
	
	public class DAZ3 extends Game
	{
		
		protected override function construct():void
		{
			loadState(new Menu());
		}
		
		
		public override function get identity():String
		{
			return 'DAZ3';
		}
		
	}
	
}