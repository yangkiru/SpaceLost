fname = "data.csv";
t = 0;
main_gid = "1524518315";
item_gid = "1419802750";
getfile = http_get_file("https://docs.google.com/spreadsheets/d/1I4Lct9u4M5GmKv-69RX8BulOE0r4RJkfGEMeYou1rnQ/gviz/tq?tqx=out:csv&sheet=data.csv", fname);


//https://docs.google.com/spreadsheets/d/1I4Lct9u4M5GmKv-69RX8BulOE0r4RJkfGEMeYou1rnQ/gviz/tq?tqx=out:csv&gid=1419802750

//function http_get_file_gid(fname, gid) {
//	return http_get_file("https://docs.google.com/spreadsheets/d/1I4Lct9u4M5GmKv-69RX8BulOE0r4RJkfGEMeYou1rnQ/gviz/tq?tqx=out:csv&gid="+gid, fname);
//}