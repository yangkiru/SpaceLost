camera = camera_create();

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(1280, 720, 1, 10000);

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

view_camera[0] = camera;

follow = obj_player_unit;
xTo = x;
yTo = y;

x = follow.x;
y = follow.y;

originW = 2560;
originH = 1440;

//Camera
camSpeed = 0.2;
camWidth = originW;
camHeight = originH;
camera_set_view_size(view_camera[0],camWidth,camHeight);
camera_set_view_border(view_camera[0],camWidth,camHeight);
//Window
windowWidth = 1280;
windowHeight = 720;
window_set_size(windowWidth, windowHeight);
//Monitor
monitorWidth = display_get_width();
monitorHeight = display_get_height();
window_set_position(monitorWidth/2-windowWidth/2, monitorHeight/2-windowHeight/2);

t = 1;
lastFollow = obj_player_unit;
current_zoom = 1;


// Shake

shake = false;
shakeDur = 0;
shakeForce = 0;