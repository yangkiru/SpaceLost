if (follow != lastFollow) {
	t = 0;
}
lastFollow = follow;
t = min(1, t + delta_time / 1000000 * camSpeed);

target_zoom = follow.camera_zoom;
if (current_zoom != target_zoom) {
	camWidth = lerp(camWidth, originW * target_zoom, t);
	camHeight = lerp(camHeight, originH * target_zoom, t);
	camera_set_view_size(view_camera[0],camWidth,camHeight);
	camera_set_view_border(view_camera[0],camWidth,camHeight);
}

current_zoom = lerp(current_zoom, target_zoom, t);
show_debug_message(current_zoom);
	

x += (xTo - x)/25;
y += (yTo - y)/25;

if (follow != noone) {
	xTo = follow.x;
	yTo = follow.y;
}

// Shake

/// approach
function approach(_start, _end, _shift) {
	if(_start < _end){
	    return min(_start + _shift, _end); 
	}else{
	    return max(_start - _shift, _end);
	}
}

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(view_camera[0], vm);

if(shake){
    shakeDur --;
    x += choose(-shakeForce,shakeForce);
    y += choose(-shakeForce,shakeForce);
    if(shakeDur <= 0){
        shake = false;
        shakeDur = 5;
		shakeForce = 0;
    }
}else{
    x = approach(x,0,0.3);
    y = approach(y,0,0.3);
}