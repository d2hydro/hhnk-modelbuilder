UPDATE
    v2_global_settings
SET interception_file = 'rasters/interception_sted.tif'
;

INSERT INTO v2_grid_refinement_area (display_name, refinement_level, code, the_geom)
select 
'urban' as display_name,
10 as refinement_level,
'urban' as code,
ST_INTERSECTION(area.wkb_geometry, (select geom from deelgebied.polder)) as the_geom
from fixed_data.locatie_riolering as area;