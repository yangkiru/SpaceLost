unit_data = global.data[? "monster1"];
event_inherited();
c = make_color_rgb(0,255,130);
image_speed = 0;
image_index = irandom_range(0,image_number);
state = States.Idle;