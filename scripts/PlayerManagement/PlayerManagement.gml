function grab_spawn_point(_player) {
	var _spawn_point = instance_find(obj_SpawnPoint, _player);
	
	if (_spawn_point == noone) {
		return {x:0, y:0};
		
	} else {
		return {x:_spawn_point.x, y:_spawn_point.y};
		
	}
	
}