/// @description Setup Player

localSteamID = steam_get_user_steam_id();
isLocal = (localSteamID == steam_id)
image_index = lobby_member_id;

moveSpeed = 5
fireCooldown = 50
currentCooldown = 0

init_controls()