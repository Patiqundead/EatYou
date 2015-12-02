
package
{
	import org.flixel.*;

	public class Player extends FlxSprite
	{
		private var mOwner				:String;
		private var mColor				:uint;
		private var mRespawnCount		:Number;
		private var mName				:FlxText;
		
		public function Player(theX :Number, theY :Number) 
		{
			//super(theX, theY);
			y = theY;
			x = theX;
			
			makeGraphic(20, 20, 0x00ff00, true, "");
			
			mRespawnCount	= 1;
			frame 			= 0;
			
			
		}
		override public function update():void {
			super.update();
			
			if (!alive) {
				mRespawnCount -= FlxG.elapsed;

				if (mRespawnCount <= 0) {
					mRespawnCount = 1;
					respawn();
					
				}
			}
			if (FlxG.keys.justPressed("SPACE")) {
				FlxG.log("PULOU");
				velocity.y = 300;
			}
			
			mName.x = x + width / 2 - mName.width / 2;
			mName.y = y + height + 5;
		}
		
		override public function draw():void {
			super.draw();
			mName.draw();
		}
		
		public function respawn() :void {
			reset(x, y);
			visible = true;
			flicker(2);
		}
		
		override public function kill():void {
			if (!alive) return;
			
			alive = false;
			visible = false;
			
			//(FlxG.state as PlayState).sounds.play(Assets.SFX_EXPLOSION0);
			
			/*for (var i: int = 0; i < 5; i++) {
				var aExplosion :Explosion = (FlxG.state as PlayState).explosion.getFirstAvailable(Explosion) as Explosion;
				
				if (aExplosion) {
					aExplosion.reset(x + FlxG.random() * 15, y + FlxG.random() * 10);
				}
			}*/
		}
		
		//public function get direction() :FlxPoint { return mDirection; }
		public function get owner() :String { return mOwner; }
		public function set owner(v :String) :void { mOwner = v; }
		public function get multiplayerColor() :uint { return mColor; }
		public function get respawnCount() :Number { return mRespawnCount; }
	}

}