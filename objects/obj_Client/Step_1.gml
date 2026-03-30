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
		
		
		
	}
	
	
	
	
}