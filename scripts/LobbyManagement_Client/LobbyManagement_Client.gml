//@self obj_Client

function sync_players(_new_list) {
	
	var _steam_ids = [];
	
	for (var _i = 0; _i < array_length(player_list); _i++) { // gets a list off all the steam ids in the old player list
		
		array_push(_steam_ids, player_list[_i].steam_id);
		
	}
	
	for (var _i = 0; _i < array_length(_new_list); _i++) { // iterates through new player list
		
		var _new_steam_id = _new_list[_i].steam_id;
		if (!array_contains(_steam_ids, _new_steam_id)) { // if old player list doesnt have the steam id in the new one
			
			var _inst = client_player_spawn_at_pos(_new_list[_i]); // spawn the player and add to list
			_new_list[_i].character = _inst;
			array_push(player_list, _new_list[_i]);
			
		} else { // if the old player list does have the steam id
			for (var _k = 0; _k = array_length(player_list); _k++) {
				
				if (player_list[_k].steam_id == _new_steam_id) { // then find the position of that player in the array and update it

					player_list[_k].start_pos = _new_list[_i].start_pos;
					player_list[_k].lobby_member_id = _new_list[_i].lobby_member_id;
					player_list[_k].steam_name = steam_get_persona_name(player_list[_k].steam_id);
					if (player_list[_k].character == undefined and player_list[_k].steam_id != _new_steam_id) { // if the character of that player doesnt exist

						var _inst = client_player_spawn_at_pos(player_list[_k]);
						player_list[_k].character = _inst;
					}
				}
			}
		}
	}
}

//@self obj_Client

function client_player_spawn_at_pos(_player_info) {
	var _layer = layer_get_id("Instances");
	
	var _name = steam_get_persona_name(_player_info.steam_id);
	var _steam_id = _player_info.steam_id;
	var _num = _player_info.lobby_member_id;
	var _loc = _player_info.start_pos;
	var _inst = instance_create_layer(_loc.x, _loc.y, _layer, obj_Player, {
		steam_name : _name,
		steam_id : _steam_id,
		lobby_member_id : _num
	});
	
	return _inst;
		
		
}

















