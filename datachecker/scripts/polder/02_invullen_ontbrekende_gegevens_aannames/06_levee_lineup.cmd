rmdir /s /q .\code\data\line-up
mkdir .\code\data\line-up
echo "Exporting levees for line-up tool"
ogr2ogr -overwrite -sql "SELECT * FROM tmp.levee_split" -f "ESRI Shapefile" .\code\data\line-up\levee_split.shp PG:"host=localhost user=postgres dbname=datachecker password=postgres port=5433" -skipfailures
echo "Executing line-up tool"
python code\raster-tools\line_up.py "\\corp.hhnk.nl\data\Hydrologen_data\Data\01.basisgegevens\rasters\DEM\DEM_AHN4_int.vrt" .\code\data\line-up\levee_split.shp .\code\data\line-up\levee_height.shp -o -d 6 -w 2 -a 75 -l line -f lineupid -e height
echo "Importing line-up tool result"
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=datachecker password=postgres port=5433" -lco "SCHEMA=tmp" -lco "FID=objectid" -nlt LINESTRING -lco "OVERWRITE=YES" -a_srs EPSG:28992 -progress -overwrite .\code\data\line-up\levee_height.shp -skipfailures