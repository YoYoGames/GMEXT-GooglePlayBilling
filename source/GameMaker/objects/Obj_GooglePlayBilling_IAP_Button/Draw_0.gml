/// @description Draw debug information


event_inherited();

// Early exit if there is no connection to the store.
if(!GPBilling_IsStoreConnected()) exit;

var json = GPBilling_Sku_GetOriginalJson(product_id)

if(is_undefined(json))
	exit

var map = json_decode(json)

if(ds_exists(map,ds_type_map))
{
	draw_set_font(Font_Yoyo_20)
	draw_set_color(c_white)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	
	var Y = y+80
	var key = ds_map_find_first(map)
	while(!is_undefined(key))
	{
		draw_text(bbox_left,Y,string_copy(key + ": " + string(map[?key]),1,25) + "...")
		Y += 30
		key = ds_map_find_next(map,key)
	}
	
	ds_map_destroy(map)
}

