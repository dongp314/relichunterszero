///Main Draw
if (owner != noone) if instance_exists_fast(owner)
{
    myString = owner.name;
	rarity = owner.rarity;
	rarityColor = rarity_get_color(rarity);
	
	x = owner.bbox_right + 8;
    y = owner.y;
    myStringLength = string_length(myString);
	
	if (owner.in_range)
    {
        if (!allowDraw){
            if (allowDrawTimeCurrent < allowDrawTime) allowDrawTimeCurrent += delta_time;
            else allowDraw = true;
        }
	}
	else {
        drawCompleted = false;
        bgAlpha = 0;
        textAlpha = 0;
        allowDraw = false;
        allowDrawTimeCurrent = 0;
    }
}
else instance_destroy();

if (allowDraw) {
			var whiteBarWidth = 16;
	        var whiteBarHeight = 16;
	        var whiteBarWidthPerString = 5;
	        var alphaSpeed = 0.002;
        
	        whiteBarWidth += (whiteBarWidthPerString * (myStringLength+2) );
    
	        if (!drawCompleted){
	                bgAlpha += alphaSpeed;
	                textAlpha += alphaSpeed;
	                if (bgAlpha) && (textAlpha) drawCompleted = true;
			}
            
	        draw_set_font(global.font_shopPrice);
	        draw_set_valign(fa_center);
	        draw_set_halign(fa_center);
			draw_set_alpha(1);
	        draw_rectangle_colour(x, y-(whiteBarHeight/2), x+whiteBarWidth, y+(whiteBarHeight/2), rarityColor, rarityColor, rarityColor, rarityColor, false );
	        if (rarity == 0) draw_set_color(c_black) else draw_set_color(c_white);
	        draw_text(x+(whiteBarWidth/2),y,string_hash_to_newline(myString));
}