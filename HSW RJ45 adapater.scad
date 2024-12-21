include <hws_openscad_attachments_and_connectors/hws_insert_util.scad>
include <eth_plug_cover.scad>

/* [Setup Parameters] */
$fa = 8;
$fs = 0.25;
epsilon = 0.001;
angle = 120;

/* [Options] */
tolerance = 0;
decoration = false;

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

union() {
    insert_plug_adv(structure);
    translate([0, 0, epsilon-eth_plug_cover_stl_ysize/2]) rotate([270, 0, angle]) eth_plug_cover_stl_obj2origin(CTR);
}
