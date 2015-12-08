package  
{
	import org.flixel.*;

	public class Level extends FlxGroup
	{
		[Embed(source = "../assets/map/Map.csv",  mimeType = "application/octet-stream")] public static const mapCSV:Class;
		[Embed(source = "../assets/map/map.png")] public static const mapPNG:Class;
		
		public var map: FlxTilemap;
		
		public function Level() {
			super();
			
			map = new FlxTilemap();
			map.loadMap(new mapCSV, mapPNG, 14, 14);
			
			add(map);
		}
	}
}