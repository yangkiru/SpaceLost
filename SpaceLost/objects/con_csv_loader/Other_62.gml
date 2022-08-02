if getfile != 0 {
	show_debug_message("load fail");
	room_restart();	// load fail
}
else {
	global.data = csv_loader(fname);

	if (global.data != noone)
		room_goto_next();
	else {
		show_debug_message("load fail");
		room_restart();
	}
}