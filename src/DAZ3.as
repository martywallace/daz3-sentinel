package
{
	
	import flash.geom.Rectangle;
	import sentinel.framework.Game;
	import sentinel.framework.graphics.TextureAtlas;
	import states.Menu;
	import starling.textures.Texture;
	
	
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
		
		
		protected override function construct():void
		{
			library.addTexture('tree', Texture.fromBitmap(new _treeAsset()));
			library.addTexture('hero', Texture.fromBitmap(new _heroAsset()));
			library.addTexture('background', Texture.fromBitmap(new _backgroundAsset()));
			library.addTexture('zombie', Texture.fromBitmap(new _zombieAsset()));
			
			library.addAtlas('weapons', new TextureAtlas(Texture.fromBitmap(new _weaponsAsset()), {
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