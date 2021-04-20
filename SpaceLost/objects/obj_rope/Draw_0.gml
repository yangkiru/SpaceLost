if(parent != -1){
	if (instance_exists(parent))
		draw_line_width(x,y, parent.x, parent.y, 3);
	else
		parent = -1;
}
else
	draw_self();