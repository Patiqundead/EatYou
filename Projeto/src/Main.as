package{
	import org.flixel.FlxGame;
	
	/**
	 * ...
	 * @author Patrick de Bastiani
	 */
	
	[SWF(width = Constantes.TAM_TELA_X, height = Constantes.TAM_TELA_Y, backgroundColor = "#FFFFFF")]
	[Frame(factoryClass = "Preloader")]
	public class Main extends FlxGame {
		
		public function Main() {
			
			//rever parametro por parametro e criar a classe das constantes
			super(Constantes.TAM_TELA_X, Constantes.TAM_TELA_Y, MenuState, 1);
			forceDebugger = true;
		}
	}	
}