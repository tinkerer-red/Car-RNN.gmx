///weight_to_color(weight)


var weight = clamp(argument0, -1, 1)
    
var green = max(0, 255*weight)
var red = max(0, 255*weight*-1)
    
color = make_colour_rgb(red, green, 000);
draw_set_color(color)

return color
