/// @description Setup Player

local_steam_id = steam_get_user_steam_id();
is_local = (local_steam_id == steam_id);

lobby_member_id = 0;

moveSpeed = 5
fireCooldown = 50
currentCooldown = 0

init_controls()