package {
	import org.flixel.*;
	/**
	 * ...
	 * @author Patrick de Bastiani
	 */
	public class MenuState extends FlxState	{
		private var labTitulo: FlxText;
		
		public function MenuState() {}
		
		override public function create():void {
			//rever parametros para pegar das contantes
			labTitulo = new FlxText(0, FlxG.height/2, FlxG.width, "Eat You");
			labTitulo.alignment = "center";
			labTitulo.color = 0x0000FF;
			FlxG.mouse.show();
			
			add(labTitulo);
		}
		
		override public function update():void {
			super.update();
			
			if (FlxG.mouse.pressed()) {
				labTitulo.text = "Click> " + FlxG.random().toString();
				FlxG.log(labTitulo.text);
			}
		}
	}
}