package daz
{
	
	import flash.geom.Rectangle;
	import sentinel.framework.BaseGame;
	import sentinel.framework.graphics.TextureAtlas;
	import sentinel.gameplay.physics.Debug;
	import starling.textures.Texture;
	import daz.states.Menu;
	
	
	public class Game extends BaseGame
	{
		
		[Embed(source = '../../assets/Background.jpg')]
		private var _backgroundAsset:Class;
		
		[Embed(source = '../../assets/Zombie.png')]
		private var _zombieAsset:Class;
		
		[Embed(source = '../../assets/General.png')]
		private var _generalAsset:Class;
		
		
		public static const DEBUG_PHYSICS:Boolean = true;
		public static const DEBUG_PHYSICS_FEATURES:Vector.<int> = new <int>[Debug.CENTER_OF_MASS, Debug.SHAPE];
		
		
		protected override function construct():void
		{
			var general:Texture = Texture.fromBitmap(new _generalAsset());
			
			library.addTexture('background', Texture.fromBitmap(new _backgroundAsset()));
			library.addTexture('zombie', Texture.fromBitmap(new _zombieAsset()));
			
			library.addAtlas('all', new TextureAtlas(general, {
				hero: new Rectangle(1, 144, 55, 50),
				tree: new Rectangle(559, 0, 178, 176),
				zombieHead1: new Rectangle(603, 228, 36, 37),
				zombieHead2: new Rectangle(639, 228, 35, 42),
				zombieHead3: new Rectangle(674, 228, 30, 37),
				zombieShoulders1: new Rectangle(557, 271, 14, 50),
				zombieShoulders2: new Rectangle(571, 271, 14, 50),
				zombieShoulders3: new Rectangle(585, 271, 13, 50),
				zombieArm1: new Rectangle(704, 229, 37, 14),
				zombieArm2: new Rectangle(492, 271, 27, 15),
				zombieArm3: new Rectangle(519, 272, 37, 15),
				rat: new Rectangle(590, 181, 63, 18),
				mummy: new Rectangle(540, 181, 50, 45),
				acolyte: new Rectangle(653, 181, 69, 46),
				hellhound: new Rectangle(495, 229, 108, 26),
				hunter: new Rectangle(494, 182, 46, 35)
			}));
			
			library.addAtlas('guns', new TextureAtlas(general, {
				'handgun': new Rectangle(1, 138, 25, 5),
				'machinegun': new Rectangle(1, 123, 56, 6),
				'shotgun': new Rectangle(1, 130, 54, 7),
				'revolver': new Rectangle(0, 117, 23, 5),
				'rocketLauncher': new Rectangle(1, 107, 37, 9),
				'lasergun': new Rectangle(1, 95, 31, 12)
			}));
			
			library.addAtlas('pickups', new TextureAtlas(general, {
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
			
			library.addAtlas('hudWeapons', new TextureAtlas(general, {
				'handgun': new Rectangle(111, 1, 138, 91),
				'machinegun': new Rectangle(111, 93, 263, 68),
				'shotgun': new Rectangle(251, 1, 268, 44),
				'revolver': new Rectangle(376, 93, 179, 87),
				'rocketLauncher': new Rectangle(111, 181, 365, 83),
				'lasergun': new Rectangle(110, 264, 211, 108)
			}));
			
			library.addAtlas('misc', new TextureAtlas(general, {
				'hudCorner': new Rectangle(322, 265, 170, 120)
			}));
			
			loadState(new Menu());
		}
		
		
		public override function get identity():String
		{
			return 'DAZ3';
		}
		
	}
	
}