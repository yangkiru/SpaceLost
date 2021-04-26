function draw_line_DDA_pattern(sx, sy, tx, ty, pattern) {

	var xr = abs(tx - sx);
	var yr = abs(ty - sy);

	if (xr > yr)
	    var l = xr;
	else
	    var l = yr;

	var px = (sx << 12) + (1 << 11);
	var py = (sy << 12) + (1 << 11);
	var ex = (tx << 12) + (1 << 11);
	var ey = (ty << 12) + (1 << 11);

	if (l != 0)
	{
	    var dx = (ex - px) / l;
	    var dy = (ey - py) / l;
	}
	else
	{
	    var dx = 0;
	    var dy = 0;
	}

	for (var i=0; i<=l; i++)
	{
	    var posx = px >> 12;
	    var posy = py >> 12;
 
	    if pattern[i % array_length_1d(pattern)]
	        draw_point(posx, posy);
    
	    px += dx;
	    py += dy;
	}
}