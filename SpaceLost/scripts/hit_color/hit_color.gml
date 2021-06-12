// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hit_color_step(){
	if blendtime>0 {
		blendtime-=1;
		blend = merge_color(c_white, c_red, blendtime/room_speed*0.667);
	}
	else
		blend=image_blend;
}

function hit_color_create(){
	blend=image_blend
	blendtime=0;
}

function hit_color_draw(){
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,blend,image_alpha);
}

function hit_color_damage(){
	blend=c_red;
	blendtime=room_speed*1.5;
}