/// @description Listening for activity as client

// Receiving Packets

while (steam_net_packet_receive()) {
	
	var _sender = steam_net_packet_get_sender_id();
	
	steam_net_packet_get_data(inbuf);
	buffer_seek(inbuf, buffer_seek_start, 0); // like a pointer
	var _type = buffer_read(inbuf, buffer_u8);
	
	switch _type {
		
		case NETWORK_PACKETS.SYNC_PLAYERS:
		
			var _player_list = buffer_read(inbuf, buffer_string);
			_player_list = json_parse(_player_list);
			sync_players(_player_list);
			break
		case NETWORK_PACKETS.SPAWN_OTHER:
			
			var _layer = layer_get_id("Instances");
			var _x = buffer_read(inbuf, buffer_u16);
			var _y = buffer_read(inbuf, buffer_u16);
			var _steam_id = buffer_read(inbuf, buffer_u64);
			var _num = array_length(player_list);
			var _inst = instance_layer_create(_x, _y, _layer, obj_Player, {
				steam_name : steam_get_user_persona_name(_steam_id),
				steam_id : _steam_id,
				lobby_member_id : _num
			});
			array_push(player_list, {
				steam_id : _steam_id,
				steam_name : steam_get_user_persona_name(_steam_id),
				character : _inst,
				lobby_member_id : _num
			})
			break
		case NETWORK_PACKETS.SPAWN_SELF:
		
		
			for (var _i = 0; _i < array_length(player_list); _i++) {
				if player_list[_i].steam_id == steam_id then lobby_member_id = player_list[_i].lobby_member_id;
			}
			
			var _layer = layer_get_id("Instances");
			var _x = buffer_read(inbuf, buffer_u16);
			var _y = buffer_read(inbuf, buffer_u16);
			var _inst = instance_create_layer(_x, _y, _layer, obj_Player, {
				steam_name : steam_name,
				steam_id : steam_id,
				lobby_member_id : lobby_member_id
			})
			player_list[0].character = _inst;
			character = _inst;
			break
		default:
			show_debug_message("Unknown packet");
			break;
		
	}
	
	
	
	
}