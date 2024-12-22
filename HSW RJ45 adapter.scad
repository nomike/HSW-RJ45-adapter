include <hws_openscad_attachments_and_connectors/hws_insert_util.scad>
include <eth_plug_cover.scad>

sideways=false;

/* [Hidden] */
$fa = 8;
$fs = 0.25;
epsilon = 0.001;
tolerance = 0;
decoration = false;


x_angle = (sideways) ? 0 : 270;
y_angle = (sideways) ? 270 : 0;
z_angle = (sideways) ? 0 : 90;
translate_z = ((sideways) ? (-epsilon-eth_plug_cover_stl_xsize/2) : (epsilon-eth_plug_cover_stl_ysize/2))+1.2;

/* [Options] */

module insert_plug_adv(structure)
{
    for (y_pos = [0:len(structure) - 1])
    {
        for (x_pos = [0:len(structure[y_pos]) - 1])
        {
            if (structure[y_pos][x_pos] != 0)
            {
                _draw_insert(structure, x_pos, y_pos, tolerance, decoration);
            }
        }
    }
}

structure = [[2]];

rotate([180, 0, 0]) union() {
    insert_plug_adv(structure);
    translate([0, 0, translate_z]) 
    rotate([x_angle, y_angle, z_angle]) eth_plug_cover_stl_obj2origin(CTR);
}
