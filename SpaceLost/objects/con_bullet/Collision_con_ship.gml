// @description Insert description here
// You can write your code in this editor
if (other.owner.object_index == owner.owner.object_index) return;

other.damage(dmg, owner);
con_bullet_pool.deactivate_obj(self);
//show_debug_message(object_get_name(owner) + " " + object_get_name(other.object_index));

push(push_force * 3);