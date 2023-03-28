echo "Loading datamining AHN3 data @ /code/data/fixed/datamining_ahn3/datamining_ahn3.shp"
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=datachecker password=postgres port=5433" -lco "GEOMETRY_NAME=wkb_geometry" -lco "SCHEMA=fixed_data" -lco "FID=objectid" -nlt MULTIPOLYGON -lco "OVERWRITE=YES" -progress .\code\data\fixed_data\datamining_ahn3\datamining_ahn3.shp -skipfailures
echo "Loading connection CODE/HydrObject @ /code/data/fixed/hydroobjectid/CODE_HydroObject_OBJECTID.dbf"
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=datachecker password=postgres port=5433" -lco "GEOMETRY_NAME=wkb_geometry" -lco "SCHEMA=fixed_data" -lco "OVERWRITE=YES" -progress .\code\data\fixed_data\hydroobjectid\CODE_HydroObject_OBJECTID.dbf -skipfailures
echo "Loading DAMO data @ /code/data/input/DAMO.gdb"
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=datachecker password=postgres port=5433" -nlt CONVERT_TO_LINEAR -lco "GEOMETRY_NAME=wkb_geometry" -lco "SCHEMA=damo_ruw" -lco "FID=objectid" -lco "OVERWRITE=YES" -progress .\code\data\input\DAMO.gdb --config PG_USE_COPY YES -gt 1000
echo "Loading HDB data @ /code/data/input/HDB.gdb"
ogr2ogr -f "PostgreSQL" PG:"host=localhost user=postgres dbname=datachecker password=postgres port=5433" -nlt CONVERT_TO_LINEAR -lco "GEOMETRY_NAME=wkb_geometry" -lco "SCHEMA=hdb" -lco "FID=objectid" -lco "OVERWRITE=YES" -progress .\code\data\input\HDB.gdb -skipfailures
