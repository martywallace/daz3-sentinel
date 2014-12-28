package
{
	
	import flash.geom.Rectangle;
	import sentinel.framework.Game;
	import sentinel.framework.graphics.TextureAtlas;
	import sentinel.gameplay.physics.Debug;
	import starling.textures.Texture;
	import states.Menu;
	
	
	public class DAZ3 extends Game
	{
		
		[Embed(source = '../assets/Tree.png')]
		private var _treeAsset:Class;
		
		[Embed(source = '../assets/Hero.png')]
		private var _heroAsset:Class;
		
		[Embed(source = '../assets/Background.jpg')]
		private var _backgroundAsset:Class;
		
		[Embed(source = '../assets/Zombie.png')]
		private var _zombieAsset:Class;
		
		[Embed(source = '../assets/Weapons.png')]
		private var _weaponsAsset:Class;
		
		
		public static const DEBUG_PHYSICS:Boolean = true;
		public static const DEBUG_PHYSICS_FEATURES:Vector.<int> = new <int>[Debug.CENTER_OF_MASS, Debug.SHAPE];
		
		
		protected override function construct():void
		{
			library.addTexture('tree', Texture.fromBitmap(new _treeAsset()));
			library.addTexture('hero', Texture.fromBitmap(new _heroAsset()));
			library.addTexture('background', Texture.fromBitmap(new _backgroundAsset()));
			library.addTexture('zombie', Texture.fromBitmap(new _zombieAsset()));
			
			library.addAtlas('guns', new TextureAtlas(Texture.fromBitmap(new _weaponsAsset()), {
				'handgun': new Rectangle(0, 43, 27, 5)
			}));
			
			loadState(new Menu());
		}
		
		
		public override function get identity():String
		{
			return 'DAZ3';
		}
		
	}
	
}