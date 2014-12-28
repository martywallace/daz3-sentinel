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
		
		[Embed(source = '../assets/Pickups.png')]
		private var _pickupsAsset:Class;
		
		
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
			
			library.addAtlas('pickups', new TextureAtlas(Texture.fromBitmap(new _pickupsAsset()), {
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
			
			loadState(new Menu());
		}
		
		
		public override function get identity():String
		{
			return 'DAZ3';
		}
		
	}
	
}