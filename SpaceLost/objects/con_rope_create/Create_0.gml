ropeY = 0;
jointY = 10;
q = ds_queue_create();


for (rope = 0; rope <= 10; rope += 1) {
    if (rope == 0) {
        rope2 = instance_create(x,ropeY+4,obj_rope_start);
		ds_queue_enqueue(q, rope2);
        ropeY += 16
    } else if (rope > 0) {
        rope1 = instance_create(x,ropeY,obj_rope);
		with(rope1){
			parent = ds_queue_tail(other.q);
		}
		ds_queue_enqueue(q, rope1);
        ropeY += 16;
        physics_joint_revolute_create(rope2,rope1,x,jointY,0,0,0,0,0,0,0);
        jointY += 16;
        rope2 = instance_create(x,ropeY,obj_rope);
		with(rope2){
			parent = ds_queue_tail(other.q);
		}
		ds_queue_enqueue(q, rope2);
        ropeY += 16;
        physics_joint_revolute_create(rope1,rope2,x,jointY,0,0,0,0,0,0,0);
        jointY += 16;
    }
}