bHeat = max(0, bHeat-1);

hit_color_step();

if owner != noone {
	// Player Input
	if (owner.owner.object_index == obj_player_unit) {
		hInput = keyboard_check(vk_right) - keyboard_check(vk_left); // left right arrows
		vInput = keyboard_check(vk_up) - keyboard_check(vk_down); // up down arrows
		bInput = keyboard_check(vk_lshift);
	} else if (owner.parent == con_em_unit){ // Enemy Input
		if (hp <= hp_max * 0.1) { // 
			var pd = point_direction(target.x, target.y, x, y);
			hInput = lengthdir_x(1, pd);
			vInput = -lengthdir_y(1, pd);
			weapon.sInput = 0;
		} else {
		// 공격을 위한 거리 조절은 준비된 무기 중 사거리가 가장 긴 것으로.
		// 일단은 무기가 없으니 임의의 거리를 두게 이동
		// 가장 가까운 타겟을 선택
		target = instance_nth_nearest(self.x, self.y, obj_player_unit, 1);
		if (target != noone) {
			if (target.control.parent == con_ship) {
					target = target.control;
				}
				target_dist = get_distance(target, self, true);
				var gap = 2000;
				if (target_dist > gap) {
					var pd = point_direction(x, y, target.x, target.y);
					hInput = lengthdir_x(1, pd);
					vInput = -lengthdir_y(1, pd);
					weapon.sInput = 0;
				} else if (target_dist > gap * 0.7){
					var pd = point_direction(x, y, target.x, target.y);
					hInput = lengthdir_x(1, pd);
					vInput = -lengthdir_y(1, pd);
					weapon.sInput = 1;
				} else {
					var pd = point_direction(target.x, target.y, x, y);
					hInput = lengthdir_x(1, pd);
					vInput = -lengthdir_y(1, pd);
					weapon.sInput = 0;
				}
			}
		}
	}
	
	// Move Ship
	if ((hInput != 0 || vInput != 0) && oil > 0) { // if got key
		oil = max(0, oil - oil_cons);
		var pd = point_direction(phy_position_x,phy_position_y,phy_position_x+hInput,phy_position_y+vInput) + 90; // get direction
		var dd = angle_difference(phy_rotation, pd);
		if (bCurrent <= 0 || bHeat > 0) {
			bInput = 0;
			if(bHeat == 0) bHeat = 120;
		}
		
		if (bInput && bCurrent >= 0 && bHeat == 0) {
			bCurrent = max(0, bCurrent-(bConsume / room_speed));
		}
		phy_rotation -= min(abs(dd), tSpd * tSpd_const * (bInput ? btSpd : 1)) * sign(dd);
		force_dir = dd;
		phy_angular_velocity = 0;
		physics_apply_local_force(0, 0, 0, -mSpd * mSpd_const * (bInput ? bmSpd : 1)); // move foward
		
	} else { // out of oil
		force_dir = 0;
		bInput = 0;
		hInput = 0;
		vInput = 0;
	}
	
} else {
	hInput = 0;
	vInput = 0;
	bInput = 0;
	force_dir = 0;
}

if (!bInput) bCurrent = min(bMax, bCurrent + bCoolSpd / room_speed);
// Shake
if (bInput && !(con_camera.shake) && con_camera.shakeForce == 0) {
		con_camera.shake = true;
		con_camera.shakeForce = 10;
		con_camera.shakeDur = 20;
} else if (bInput && con_camera.shakeDur <= 1) {
		con_camera.shake = true;
		con_camera.shakeForce = 3;
		con_camera.shakeDur = 5;
}