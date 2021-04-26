fname = "data.csv";
getfile = http_get_file("https://docs.google.com/spreadsheets/d/1I4Lct9u4M5GmKv-69RX8BulOE0r4RJkfGEMeYou1rnQ/gviz/tq?tqx=out:csv&sheet=data.csv", fname);

if getfile != 0 {
	show_debug_message("load fail");
	room_restart();	// load fail
}