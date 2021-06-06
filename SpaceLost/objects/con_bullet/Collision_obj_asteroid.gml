if (owner == noone) return;
con_bullet_pool.deactivate_obj(self);

if (--pierce >= 0)
	push(kb_force);