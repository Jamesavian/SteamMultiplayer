/// @description Listening for lobby creation

switch (async_load[?"event_type"]) {

	case "lobby_created":
		show_debug_message("Lobby created: " + string(steam_lobby_get_lobby_id()));
		steam_lobby_join_id(steam_lobby_get_lobby_id());
	
		break
		
	case "lobby_joined":
	
		show_debug_message("Lobby joined: " + string(steam_lobby_get_lobby_id()));
		
		if (steam_lobby_is_owner()) { // steam lobby can store a dictioanary of data
			steam_lobby_set_data("isGameMakerTest", "true");
			steam_lobby_set_data("Creator", steam_get_persona_name());
		}
		
		room_goto(rm_GameRoom);





}