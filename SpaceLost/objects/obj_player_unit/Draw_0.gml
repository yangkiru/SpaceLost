event_inherited();

if (control == object_index) {
	var d = oxygen / oxygen_max;
	var c = merge_color(make_color_rgb(255, 0, 0), make_color_rgb(22, 187, 255), d);
	draw_set_font(fnt_oxygen_p);
	draw_set_halign(fa_center);
	var str = "Oxygen\n" + string_format(d * 100, 0, 0) + "%";
	draw_text_outline(x, y - 150, c_white, c, str, 4);
}