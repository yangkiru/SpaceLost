if (obj_player_unit.control != lastControl) {
	t = 0;
}
lastControl = obj_player_unit.control;
t = min(1, t + delta_time / 1000000 * camSpeed);

if (!obj_player_unit.control) {
	if (camWidth < maxSizeW) {
		camWidth = lerp(camWidth, maxSizeW, t);
		camHeight = lerp(camHeight, maxSizeH, t);
		camera_set_view_size(view_camera[0],camWidth,camHeight);
		camera_set_view_border(view_camera[0],camWidth,camHeight);
	}
} else { 
	if (camWidth > minSizeW) {
		camWidth = lerp(camWidth, minSizeW, t);
		camHeight = lerp(camHeight, minSizeH, t);
		camera_set_view_size(view_camera[0],camWidth,camHeight);
		camera_set_view_border(view_camera[0],camWidth,camHeight);
	}
}
	
	

x += (xTo - x)/25;
y += (yTo - y)/25;

if (follow != noone) {
	xTo = follow.x;
	yTo = follow.y;
}

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(view_camera[0], vm);

