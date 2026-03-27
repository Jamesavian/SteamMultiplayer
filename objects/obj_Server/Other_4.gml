/// @description Insert description here
// You can write your code in this editor

var _player_layer = layer_get_id("Instances");

for (var _player = 0; _player < array_length(player_list); _player++) {
	var _pos = grab_spawn_point(_player);
	var _inst = instance_create_layer(_pos.x, _pos.y, _player_layer, obj_Player, {
		steam_name	: player_list[_player].steam_name,
		steam_id	: player_list[_player].steam_id,
		lobby_member_id : _player
	});
	
	
	player_list[_player].character = _inst
	player_list[_player].start_pos = _pos
	if (player_list[_player].steam_id == steam_id) then { // should alwyas be player 0
		character = _inst;
	}
}