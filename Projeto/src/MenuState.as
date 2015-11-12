package {
	import org.flixel.*;
	/**
	 * ...
	 * @author Patrick de Bastiani
	 */
	public class MenuState extends FlxState	{
		private var labTitulo: FlxText;
		private var labConstantes: FlxText;
		private var labAviso: FlxText;
		
		public function MenuState() {}
		
		override public function create():void {
			labConstantes = new FlxText(0, 0, FlxG.width, "");
			labConstantes.color = 0xFFFFFF;
			labConstantes.alignment = "left";
			labConstantes.size = 12;
			labConstantes.text = "Tamanho da tela: "
								+ Constantes.TAM_TELA_X.toString()
								+ "x"
								+ Constantes.TAM_TELA_Y.toString()
								+ "."
								+ "\n"
								+ "teste quebra de linha"
								;
			
			labTitulo = new FlxText(0, FlxG.height/2, FlxG.width, "Eat You");
			labTitulo.alignment = "center";
			labTitulo.color = 0x0000FF;
			
			labAviso = new FlxText(0, FlxG.height - (FlxG.height / 2 * (0.5)), FlxG.width, "Clique para jogar!");
			labAviso.alignment = "center";
			labAviso.color = 0xFF00FF;
			
			FlxG.mouse.show();
			
			add(labConstantes);
			add(labTitulo);
			add(labAviso);
		}
		
		override public function update():void {
			super.update();
			labAviso.flicker(1);
			if (FlxG.mouse.pressed()) {
				labTitulo.text = "Click> " + FlxG.random().toString();
				FlxG.log(labTitulo.text);
				FlxG.fade(0xff000000, 1);
				FlxG.switchState(new GameState());
			}
		}
	}
}