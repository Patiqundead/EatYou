package  
{
	import org.flixel.*;

	public class Background extends FlxGroup
	{
		[Embed(source = "../assets/map/Map.csv",  mimeType = "application/octet-stream")] public static const mapCSV:Class;
		[Embed(source="../assets/map/map.png")] public static const mapPNG:Class;
		
		public var map: FlxTilemap;
		
		public function Background() {
			//var aBackground :FlxSprite = new FlxSprite(0, 0, Assets.mapPNG);
			
			//var aRows :int = Constants.WORLD_HEIGHT / aBackground.height;
			//var aCols :int = Constants.WORLD_WIDTH / aBackground.width;
			/*
			for (var i:int = 0; i < aRows; i++) {
				for (var j:int = 0; j < aCols; j++) {
					add(new FlxSprite(j * aBackground.width, i * aBackground.height, Assets.mapPNG));
				}
			}
			*/
			super();
			
			map = new FlxTilemap();
			map.loadMap(new mapCSV, mapPNG, 14, 14);
			//map.setTileProperties(1, FlxObject.NONE, null, null, 20);
			
			add(map);
		}
	}
}