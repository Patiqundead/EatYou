package 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Patrick de Bastiani
	 */
	public class Background extends FlxGroup{
		[Embed(source = "./assets/dirtCenter.png")] public static const BACKGROUND :Class;
		
		public var map: FlxTilemap;
		
		public function Background() {
			super();
			var txt: FlxText = new FlxText(0, 0, FlxG.width, "teste background");
			txt.color = 0x00FF0;
			map = new FlxTilemap();
			map.loadMap("0", BACKGROUND, 70, 70);
			
			add(map);
			add(txt);
		}
		
	}

}