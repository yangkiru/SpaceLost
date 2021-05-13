sInput = keyboard_check(vk_space);

if (sInput && image_index < 1) {
	image_speed = 1;
} else if (image_index > image_number - 1) {
	image_speed = 0;
	image_index = 0;
}