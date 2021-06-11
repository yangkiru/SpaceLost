var h = 128;
var v = 128;
var hm = h * 0.5;
var vm = v * 0.5;
var r = 64;
target = obj_player_unit.control;
if (target == noone || target.parent != con_ship) return;
if( !surface_exists(surf) ){
    surf = surface_create( h,v );
}

var numberofsections = 60; // there is no draw_get_circle_precision() else I would use that here
var sizeofsection = 360/numberofsections;
var val = (target.oil / target.oil_max) * numberofsections;
show_debug_message(val);
if (val > 0) {
	surface_set_target( surf );
		draw_clear_alpha(c_white,0);
		
		draw_set_color(make_color_rgb(255,201,50));
		draw_primitive_begin(pr_trianglefan);
			draw_vertex(hm,vm);
			for(i=0; i<=val; i++) {
		        len = (i*sizeofsection)+90; // the 90 here is the starting angle
		        tx = lengthdir_x(r, len);
		        ty = lengthdir_y(r, len);
		        draw_vertex(hm+tx, vm+ty);
			}
		draw_primitive_end();
		gpu_set_blendmode(bm_normal);

	surface_reset_target( );

	// draw surface here if need be.
	draw_surface( surf, x-hm,y-vm );
}
