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
		
		public function GameState() {}
		
		override public function create(): void {
			_Background = new Background();
			
			FlxG.worldBounds = new FlxRect(0, 0, Constantes.TAM_TELA_X, Constantes.TAM_TELA_Y);
			FlxG.camera.setBounds(0, 0, FlxG.worldBounds.width, FlxG.worldBounds.height);
		}
		
		override public function update(): void {
			super.update()
			
			if (FlxG.mouse.pressed()) {
				FlxG.log("click dentro do jogo");
			}
		}
		
	}

}