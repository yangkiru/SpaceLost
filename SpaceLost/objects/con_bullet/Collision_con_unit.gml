if (!active || owner == noone || other.owner == owner.owner) return;

if (--pierce >= 0) {
	other.damage(dmg, owner);
	con_bullet_pool.deactivate_obj(self);
	//show_debug_message(object_get_name(owner) + " " + object_get_name(other.object_index));
	push(kb_force);
}