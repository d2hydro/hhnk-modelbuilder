#!/bin/bash
mkdir /code/tmp -p
rm -f /code/tmp/datachecker_output.gpkg
echo "Exporting data to tempory GeoPackage"
ogr2ogr -overwrite -sql "SELECT * FROM checks.afvoergebieden" -nln afvoergebieden -f "GPKG" /code/tmp/datachecker_output.gpkg PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt MultiPolygon
ogr2ogr -overwrite -sql "SELECT code, geom,	omschrijving, startpeil, eindpeil, polderkant FROM checks.afvoerkunstwerken" -nln afvoerkunstwerken -f "GPKG" /code/tmp/datachecker_output.gpkg PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt Point
ogr2ogr -overwrite -sql "SELECT * FROM checks.bridge" -nln bridge -f "GPKG" /code/tmp/datachecker_output.gpkg PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt Point
ogr2ogr -overwrite -sql "SELECT id, organisation_id, created, code, type, bed_level, comment, name, talud_left, talud_right, image_url, geom, channel_type_id, bed_width, tabulated_width, tabulated_height, derived_bed_level, profile_valid, profile_type, typering, aanname, hasassumption FROM checks.channel" -nln channel -f "GPKG" /code/tmp/datachecker_output.gpkg PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt Linestring
ogr2ogr -overwrite -sql "SELECT bufgeom, id, channel_type_id FROM checks.channel_linemerge" -nln channel_linemerge -f "GPKG" /code/tmp/datachecker_output.gpkg PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt Polygon
ogr2ogr -overwrite -sql "SELECT id::int, geom, polder_id, lengte FROM checks.channel_loose" -nln channel_loose -f "GPKG" /code/tmp/datachecker_output.gpkg PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt Polygon
ogr2ogr -overwrite -sql "SELECT id::int, geom, polder_id, lengte FROM checks.channel_nowayout" -nln channel_nowayout -f "GPKG" /code/tmp/datachecker_output.gpkg PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt Polygon
ogr2ogr -overwrite -sql "SELECT * FROM checks.crossprofile" -nln crossprofile -f "GPKG" /code/tmp/datachecker_output.gpkg PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt Polygon
ogr2ogr -overwrite -sql "SELECT * FROM checks.crosssection" -nln crosssection -f "GPKG" /code/tmp/datachecker_output.gpkg PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt Point
ogr2ogr -overwrite -sql "SELECT id, organisation_id, created, code, type, level_seperator_indicator, bed_level_upstream , bed_level_downstream, width, length, allowed_flow_direction, height, material, shape as shape_culvert, description, image_url, geom, num_timeseries, channel_code, channel_type_id, type_art, opmerking, wgtype_id, fixeddrainagelevelarea_id_1, fixeddrainagelevelarea_id_2, on_fdla_border, on_polder_border, closeable, hdb_open, inlet, opmerk_datamining, aanname, isusable, hasassumption FROM checks.culvert" -nln culvert -f "GPKG" /code/tmp/datachecker_output.gpkg PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt Linestring
ogr2ogr -overwrite -sql "SELECT tabel, code, opmerking, geom_point FROM checks.dubbele_kunstwerken" -nln dubbele_kunstwerk_point -f "GPKG" /code/tmp/datachecker_output.gpkg PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt Point
ogr2ogr -overwrite -sql "SELECT tabel, code, opmerking, geom_line FROM checks.dubbele_kunstwerken" -nln dubbele_kunstwerk_line -f "GPKG" /code/tmp/datachecker_output.gpkg PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt Point
ogr2ogr -overwrite -sql "SELECT * FROM checks.fixed_dam" -nln fixed_dam -f "GPKG" /code/tmp/datachecker_output.gpkg PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt Point
ogr2ogr -overwrite -sql "SELECT * FROM checks.fixeddrainagelevelarea" -nln fixeddrainagelevelarea -f "GPKG" /code/tmp/datachecker_output.gpkg PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt MultiPolygon
ogr2ogr -overwrite -sql "SELECT * FROM checks.geen_peil" -nln geen_peil -f "GPKG" /code/tmp/datachecker_output.gpkg PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt MultiPolygon
ogr2ogr -overwrite -sql "SELECT * FROM checks.invalid_geometry" -nln invalid_geometry -f "GPKG" /code/tmp/datachecker_output.gpkg PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt MultiPolygon
ogr2ogr -overwrite -sql "SELECT (ST_Dump(pointgeom)).geom as pointgeom, channel_id, levee_ring_id::int, channel_type_id FROM checks.kruising_zonder_kunstwerk" -nln kruising_zonder_kunstwerk -f "GPKG" /code/tmp/datachecker_output.gpkg PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt Point
ogr2ogr -overwrite -sql "SELECT * FROM checks.overlappende_geometrie" -nln overlappende_geometrie -f "GPKG" /code/tmp/datachecker_output.gpkg PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt MultiPolygon
ogr2ogr -overwrite -sql "SELECT * FROM checks.polder" -nln polder -f "GPKG" /code/tmp/datachecker_output.gpkg PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt MultiPolygon
ogr2ogr -overwrite -sql "SELECT id, organisation_id, created, code, type, start_point_id, end_point_id, connection_serial, capacity, start_level, stop_level, name, allowed_flow_direction, start_level_delivery_side, stop_level_delivery_side, image_url, geom, from_fixeddrainagelevelarea_code as from_fdla_code, to_fixeddrainagelevelarea_code as to_fdla_code, channel_code, code_polder, opmerking, wgtype_id, channel_type_id, opmerk_datamining, typering, aanname, isusable, hasassumption FROM checks.pumpstation" -nln pumpstation -f "GPKG" /code/tmp/datachecker_output.gpkg PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt Point
ogr2ogr -overwrite -sql "SELECT * FROM checks.sluice" -nln sluice -f "GPKG" /code/tmp/datachecker_output.gpkg PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt Point
ogr2ogr -overwrite -sql "SELECT id, organisation_id, created, code, type, crest_width, crest_level, name, lat_dis_coeff, angle, allowed_flow_direction, controlled, comment, discharge_coeff, image_url, geom, num_timeseries, shape as weir_shape, controlled_ficeddrainagelevelarea_code as controlled_fdla_code, channel_code, type_function, opmerking, wgtype_id, channel_type_id, opmerk_datamining, crest_height_datamining, aanname, isusable, hasassumption FROM checks.weirs" -nln weirs -f "GPKG" /code/tmp/datachecker_output.gpkg PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt Point
ogr2ogr -overwrite -sql "SELECT geom, levee_ring_id, levee_id, maximum_water_level, height, opmerking FROM checks.levee" -nln levee -f "GPKG" /code/tmp/datachecker_output.gpkg PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt Linestring
ogr2ogr -overwrite -sql "SELECT * FROM checks.control_table" -nln control_table -f "GPKG" /code/tmp/datachecker_output.gpkg PG:"host=db user=postgres dbname=datachecker password=postgres port=5432" -nlt Point
echo "Copy Geopackage to output folder"
cp /code/tmp/datachecker_output.gpkg /code/data/output/datachecker_output.gpkg