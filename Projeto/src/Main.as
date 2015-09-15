package
{
	import org.flixel.FlxGame;
	
	/**
	 * ...
	 * @author Patrick de Bastiani
	 */
	
	[SWF(width = "640", height = "480", backgroundColor = "#FFFFFF")]
	[Frame(factoryClass = "Preloader")]
	public class Main extends FlxGame
	{
		public function Main()
		{
			//rever parametro por parametro e criar a classe das constantes
			super(640, 480, MenuState, 1);
			forceDebugger = true;
		}
	}	
}