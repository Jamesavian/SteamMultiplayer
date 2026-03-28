/// @description Setup lobby_list

lobby_list = []

image_xscale = x_scale;
image_yscale = y_scale;

lobby_list[0] = instance_create_depth(x, bbox_top + 40, -20, obj_LobbyItem);


// filtering lobbies by an attribute
steam_lobby_list_add_string_filter("isGameMakerTest", "true", steam_lobby_list_filter_eq);
// finding the lobbies after filiter is applied
steam_lobby_list_request();

reset_lobby_list = function () {
	for (var _i = 0; _i < array_length(lobby_list); _i++) {
		show_debug_message("Deleting: " + string(lobby_list[_i]));
		
		instance_destroy(lobby_list[_i]);

		
	}
	lobby_list = [];
	
	
	
	
}