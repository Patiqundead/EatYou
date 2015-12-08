package  
{
	import org.flixel.*;

	public class Background extends FlxGroup
	{
		[Embed(source = "../assets/map/bg.csv",  mimeType = "application/octet-stream")] public static const mapCSV:Class;
		[Embed(source = "../assets/map/bg.png")] public static const mapPNG:Class;
		
		public var map: FlxTilemap;
		
		public function Background() {
			//super();
			
			map = new FlxTilemap();
			map.loadMap(new mapCSV, mapPNG, 32, 32);
			
			add(map);
		}
	}
}