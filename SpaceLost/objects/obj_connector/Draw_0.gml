if (connected != noone && instance_exists(connected)) {
	depth = connected.depth - 1;
	draw_self();
}