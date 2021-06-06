if (!active || owner == noone || other.owner == owner) return;

pierce--;
con_bullet_pool.deactivate_obj(self);