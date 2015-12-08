import org.flixel.plugin.photonstorm.*;
/**
 * Copyright (c) 2013, Fernando Bevilacqua
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 * 
 *   Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * 
 *   Redistributions in binary form must reproduce the above copyright notice, this
 *   list of conditions and the following disclaimer in the documentation and/or
 *   other materials provided with the distribution.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class Ship extends FlxSprite
	{
		private var mDirection 			:FlxPoint;
		private var mOwner				:String;
		private var mColor				:uint;
		private var mRespawnCount		:Number;
		private var mName				:FlxText;
		
		public function Ship(theOwner :String, theX :Number, theY :Number, theColor :uint, theName :String) {
			super(theX, theY);
			loadGraphic(Assets.SHIPS, true, false, 20, 30, true);
			
			mOwner 			= theOwner;
			mColor 			= theColor;
			mRespawnCount	= Constants.PLAYER_RESPAWN;
			mName			= new FlxText(x, y, 60, theName);
			mName.color		= theColor != 0 ? theColor : 0xffffff;
			mName.alignment	= "center";
			frame 			= 0;
			
			addAnimation("idle", [0], 0, false);
			addAnimation("walk", [0, 1, 0, 2], 10, true);
			addAnimation("jump", [1], 0, false);
			
			if (FlxG.getPlugin(FlxControl) == null) {
				FlxG.addPlugin(new FlxControl);
			}
			
			FlxControl.create(this, FlxControlHandler.MOVEMENT_ACCELERATES, FlxControlHandler.STOPPING_DECELERATES, 1, true, false);
			
			FlxControl.player1.setCursorControl(false, false, true, true);
			FlxControl.player1.setJumpButton("SPACE", FlxControlHandler.KEYMODE_PRESSED, 100, FlxObject.FLOOR, 250, 200);
			FlxControl.player1.setBounds(1, 1, Constants.GAME_ORG_WIDTH, Constants.GAME_ORG_HEIGHT);
			FlxControl.player1.setMovementSpeed(100, 0, 100, 100, 100, 0);
			FlxControl.player1.setGravity(0, 100);
			
			if(theColor != 0) {
				color = theColor;
			}
			
		}
		
		override public function update():void {
			super.update();
			
			if (!alive) {
				mRespawnCount -= FlxG.elapsed;

				if (mRespawnCount <= 0) {
					mRespawnCount = Constants.PLAYER_RESPAWN;
					respawn();
					
					if (amIPlayerControlled()) {
						(FlxG.state as PlayState).hud.hideMessages();	
					}
				}
			}
			
			mName.x = x + width / 2 - mName.width / 2;
			mName.y = y + height + 5;
			
			if (touching == FlxObject.FLOOR)
			{
				if (velocity.x != 0)
				{
					play("walk");
				}
				else
				{
					play("idle");
				}
			}
			else //if (velocity.y < 0)
			{
				play("jump");
			}
		}
		
		override public function draw():void {
			super.draw();
			mName.draw();
		}
		
		private function amIPlayerControlled() :Boolean {
			return owner == (FlxG.state as PlayState).player.owner;
		}
		
		public function respawn() :void {
			reset(x, y);
			visible = true;
			flicker(Constants.PLAYER_IMMUNIZATION);
		}
		
		override public function kill():void {
			if (!alive) return;
			
			alive = false;
			visible = false;
		}
		
		public function get direction() :FlxPoint { return mDirection; }
		public function get owner() :String { return mOwner; }
		public function set owner(v :String) :void { mOwner = v; }
		public function get multiplayerColor() :uint { return mColor; }
		public function get respawnCount() :Number { return mRespawnCount; }
	}
}