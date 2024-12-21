// File: eth_plug_cover.stl

eth_plug_cover_stl_xsize = 12.4;
eth_plug_cover_stl_ysize = 16.0;
eth_plug_cover_stl_zsize = 14.9;
eth_plug_cover_stl_xposition = -12.4;
eth_plug_cover_stl_yposition = -12.0;
eth_plug_cover_stl_zposition = -14.9;


NE=1; NW=2; SW=3; SE=4; CTR=5; CTRXY=6;

module eth_plug_cover_stl_obj2origin (where) {
    if (where == NE) {
        eth_plug_cover_stl_objNE ();
    }

    if (where == NW) {
        translate([-12.4,0,0])
        eth_plug_cover_stl_objNE ();
    }

    if (where == SW) {
        translate([-12.4,-12.4,0])
        eth_plug_cover_stl_objNE ();
    }

    if (where == SE) {
        translate([0,-16.0,0])
        eth_plug_cover_stl_objNE ();
    }

    if (where == CTR) {
        translate([-6.2,-8.0,-7.45])
        eth_plug_cover_stl_objNE ();
    }

    if (where == CTRXY) {
        translate([-6.2,-8.0,0])
        eth_plug_cover_stl_objNE ();
    }
}

module eth_plug_cover_stl_objNE () {
    translate([12.4, 12.0, 14.9])
        import("eth_plug_cover.stl");
}
