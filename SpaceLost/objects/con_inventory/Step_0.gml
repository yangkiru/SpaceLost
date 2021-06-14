var layer_id = layer_get_id("Inventories");
var layer_visible = layer_get_visible(layer_id);
layer_set_visible(layer_id, !layer_visible);
show_debug_message(layer_visible);