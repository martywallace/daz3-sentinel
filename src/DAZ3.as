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
		
		[Embed(source = '../assets/General.png')]
		private var _generalAsset:Class;
		
		
		public static const DEBUG_PHYSICS:Boolean = true;
		public static const DEBUG_PHYSICS_FEATURES:Vector.<int> = new <int>[Debug.CENTER_OF_MASS, Debug.SHAPE];
		
		
		protected override function construct():void
		{
			library.addTexture('tree', Texture.fromBitmap(new _treeAsset()));
			library.addTexture('hero', Texture.fromBitmap(new _heroAsset()));
			library.addTexture('background', Texture.fromBitmap(new _backgroundAsset()));
			library.addTexture('zombie', Texture.fromBitmap(new _zombieAsset()));
			
			library.addAtlas('guns', new TextureAtlas(Texture.fromBitmap(new _generalAsset()), {
				'handgun': new Rectangle(1, 138, 25, 5),
				'machinegun': new Rectangle(1, 123, 56, 6),
				'shotgun': new Rectangle(1, 130, 54, 7),
				'revolver': new Rectangle(0, 117, 23, 5),
				'rocketLauncher': new Rectangle(1, 107, 37, 9),
				'lasergun': new Rectangle(1, 95, 31, 12)
			}));
			
			library.addAtlas('pickups', new TextureAtlas(Texture.fromBitmap(new _generalAsset()), {
				'handgun': new Rectangle(0, 0, 24, 16),
				'handgunAmmo': new Rectangle(26, 1, 15, 9),
				'machinegun': new Rectangle(0, 26, 70, 16),
				'machinegunAmmo': new Rectangle(72, 27, 15, 9),
				'shotgun': new Rectangle(0, 82, 72, 12),
				'shotgunAmmo': new Rectangle(74, 83, 15, 9),
				'revolver': new Rectangle(0, 48, 26, 12),
				'revolverAmmo': new Rectangle(28, 49, 15, 9),
				'rocketLauncher': new Rectangle(0, 60, 93, 22),
				'rocketLauncherAmmo': new Rectangle(95, 61, 15, 9),
				'lasergun': new Rectangle(41, 0, 52, 26),
				'lasergunAmmo': new Rectangle(95, 1, 13, 9),
				'healthpack': new Rectangle(89, 27, 21, 21)
			}));
			
			library.addAtlas('hudWeapons', new TextureAtlas(Texture.fromBitmap(new _generalAsset()), {
				'handgun': new Rectangle(111, 1, 138, 91),
				'machinegun': new Rectangle(111, 93, 263, 68),
				'shotgun': new Rectangle(251, 1, 268, 44),
				'revolver': new Rectangle(376, 93, 179, 87),
				'rocketLauncher': new Rectangle(111, 181, 365, 83),
				'lasergun': new Rectangle(110, 264, 211, 108)
			}));
			
			loadState(new Menu());
		}
		
		
		public override function get identity():String
		{
			return 'DAZ3';
		}
		
	}
	
}