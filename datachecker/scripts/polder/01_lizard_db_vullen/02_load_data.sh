#!/bin/bash
echo "Loading datamining AHN3 data @ /code/data/fixed/datamining_ahn3/datamining_ahn3.shp"
ogr2ogr -f "PostgreSQL" PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -lco "GEOMETRY_NAME=wkb_geometry" -lco "SCHEMA=fixed_data" -lco "FID=objectid" -nlt MULTIPOLYGON -lco "OVERWRITE=YES" -progress /code/data/fixed_data/datamining_ahn3/datamining_ahn3.shp 
echo "Loading connection CODE/HydrObject @ /code/data/fixed/hydroobjectid/CODE_HydroObject_OBJECTID.dbf"
ogr2ogr -f "PostgreSQL" PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -lco "GEOMETRY_NAME=wkb_geometry" -lco "SCHEMA=fixed_data" -lco "OVERWRITE=YES" -progress /code/data/fixed_data/hydroobjectid/CODE_HydroObject_OBJECTID.dbf
echo "Loading DAMO data @ /code/data/input/DAMO.gpkg"
ogr2ogr -f "PostgreSQL" PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt CONVERT_TO_LINEAR -lco "GEOMETRY_NAME=wkb_geometry" -lco "SCHEMA=damo_ruw" -lco "FID=objectid" -lco "OVERWRITE=YES" -nlt PROMOTE_TO_MULTI /code/data/input/DAMO.gpkg --config PG_USE_COPY YES -gt 1000  #DEBUG: -skipfailures uitzetten
echo "Loading HDB data @ /code/data/input/HDB.gpkg"
ogr2ogr -f "PostgreSQL" PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt CONVERT_TO_LINEAR -lco "GEOMETRY_NAME=wkb_geometry" -lco "SCHEMA=hdb" -lco "FID=objectid" -lco "OVERWRITE=YES" -nlt PROMOTE_TO_MULTI /code/data/input/HDB.gpkg
echo "Loading Urban data  @ /code/data/fixed/urban/locatie_riolering.gpkg"
ogr2ogr -f "PostgreSQL" PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt CONVERT_TO_LINEAR -lco "GEOMETRY_NAME=wkb_geometry" -lco "SCHEMA=fixed_data" -lco "FID=fid" -lco "OVERWRITE=YES" /code/data/fixed_data/urban/locatie_riolering.gpkg

#DEBUGGING:
# ogr2ogr -overwrite -f "GPKG" /code/tmp/debugging.gpkg PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt MultiPolygon -sql "SELECT * FROM damo_ruw.peilafwijkinggebied" -nln peilafwijking
# ogr2ogr -overwrite -f "GPKG" /code/tmp/debugging.gpkg PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt None -sql "SELECT * FROM damo_ruw.streefpeil" -nln streefpeil
# echo "Copy Geopackage debugging to output folder"
# cp /code/tmp/debugging.gpkg /code/data/output/datachecker_debugging.gpkg
# rm /code/tmp -rf