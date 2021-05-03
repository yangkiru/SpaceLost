move_towards_point(head.x,head.y,8);
if (point_distance(x,y,tail.x,tail.y) > gap){
    x = tail.x + lengthdir_x(gap,point_direction(tail.x,tail.y,x,y));
    y = tail.y + lengthdir_y(gap,point_direction(tail.x,tail.y,x,y));
}