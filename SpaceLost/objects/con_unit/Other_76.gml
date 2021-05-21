/// @description move
var _eventType = event_data[? "event_type"];
var _message = event_data[? "message"];
var _eId = event_data[? "element_id"];



if (_eventType == "sprite event") {
	var _inst = layer_instance_get_instance(_eId);
	if (_inst.object_index == object_index) {
		switch (_message) {
			case "move":
				movement();
			break;
		}
	}
} else if (_eventType == "sequence event") {
	var _inst = layer_sequence_get_sequence(_eId);
	var _obj_arr = sequence_get_objects(_inst);
	if (instance_exists(_obj_arr[0]) && _obj_arr[0].object_index == object_index) {
		switch (_message)
	    {
			case "move":
				movement();
				break;
	    }
	}
}