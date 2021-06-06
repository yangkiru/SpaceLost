function attack() {
	var bullet = pool.activate_obj();
	with (bullet) {
		phy_position_x = other.x;
		phy_position_y = other.y;
		phy_rotation = -other.image_angle;
		phy_speed_x = 0;
		phy_speed_y = 0;
		
		physics_apply_local_impulse(0, 0, 0, -other.pro_force);
		phy_angular_velocity = 0;
		owner = other.owner;
		dmg = other.pro_dmg;
		alarm[0] = other.pro_lifetime;
		kb_force = other.kb_force;
		pierce = 1;
	}
	is_cool = false;
	if (owner.spr_shoot != noone) {
		owner.sprite_index = owner.spr_shoot;
		owner.image_index = 0;
	}
	alarm[0] = shoot_spd;
	var eff = obj_ship_shoot_eff_pool.activate_obj();
	eff.parent = self;
	eff.x = x;
	eff.y = y;
	eff.image_angle = image_angle;
}

function equip_weapon() {
	owner = other.object_index;
	offsetX = x - owner.x;
	offsetY = y - owner.y;
}

// Variable Settings
// weapon_data = global.data[? "weapon_name"];

shoot_spd = real(weapon_data[? "shoot_spd"]);
pro_amount = real(weapon_data[? "pro_amount"]);
pro_dmg = real(weapon_data[? "pro_dmg"]);
pro_lifetime = real(weapon_data[? "pro_lifetime"]);
pro_force = real(weapon_data[? "pro_force"]);
kb_force = real(weapon_data[? "kb_force"]);

image_speed = 0;
owner = noone;
offsetX = 0;
offsetY = 0;

is_cool = true;
sInput = false;