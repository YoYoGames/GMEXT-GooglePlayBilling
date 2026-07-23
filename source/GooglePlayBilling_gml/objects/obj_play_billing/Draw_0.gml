
draw_set_font(fnt_gm_15)
draw_set_halign(fa_left)
draw_set_valign(fa_left)

draw_text(50,100,$"connection_state: {play_billing_get_connection_state()}")

draw_text(50,130,$"is_ready: {play_billing_is_ready()}")

