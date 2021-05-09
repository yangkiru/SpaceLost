/// @description move
var _eventType = event_data[? "event_type"];
var _message = event_data[? "message"];
if (_eventType == "sprite event") {
	switch (_message) {
		case "move":
			movement();
		break;
	}
}