package 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Patrick de Bastiani
	 */
	public class GameState extends FlxState {
		
		private var _Background: Background;
		private var _Player: Player;
		//private var _Multiplayer:Multiplayer;
	
		public function GameState() {}
		
		override public function create(): void {
			_Background = new Background();
			_Player = new Player( 100, 100);
		
			FlxG.worldBounds = new FlxRect(0, 0, Constantes.TAM_TELA_X, Constantes.TAM_TELA_Y);
			FlxG.camera.setBounds(0, 0, FlxG.worldBounds.width, FlxG.worldBounds.height);
			
			
			add(_Background);
			add(_Player);
			
			super.create();
		}
		
		override public function update(): void {
			super.update()
			
			//_Multiplayer.update();
			
			if (FlxG.mouse.pressed()) {
				FlxG.log("click dentro do jogo");
			}
			updatePlayerInput();
		}
		
		public function updatePlayerInput():void {
			if (!_Player.alive) return;
			
			
			if (FlxG.keys.pressed("UP") || FlxG.keys.pressed("SPACE")) {
				
				FlxG.log("CLICK UP OR SPACE")
				_Player.y += _Player.y * 2.0;// * aSign;
			}
			
			if (FlxG.keys.pressed("LEFT")) 
			{
				FlxG.log("LEFT")
				_Player.x -= _Player.x * 1.1;// * aSign;	
			}
			
			if (FlxG.keys.pressed("RIGHT")) 
			{
				FlxG.log("RIGHT")
				_Player.x += _Player.x * 0.1;// * aSign;
			}
		}
		
	}

}