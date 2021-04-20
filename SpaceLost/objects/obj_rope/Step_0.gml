if held = true {
    physics_apply_force(x,y,(mouse_x-x)*10,(mouse_y-y)*10);
}

if not mouse_check_button(mb_left) {
    held = false;
}

