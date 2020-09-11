///scr_dis_to_solid(direction)


var xx = x
var yy = y
var dis = 0

for (var i = 300; i > 0; i -= 100)
{
  if (collision_line(x,y,x+lengthdir_x(i, argument0),y+lengthdir_y(i, argument0),obj_wall,0,1) != noone){
    if (collision_line(x,y,x+lengthdir_x(i-100, argument0),y+lengthdir_y(i-100, argument0),obj_wall,0,1) = noone){
      var dis = i-100
      while (collision_point(xx, yy, obj_wall, 0, true) = noone)
      {
        dis += 10
        xx = x+lengthdir_x(dis, argument0)
        yy = y+lengthdir_y(dis, argument0)
      }
      //show_debug_message(dis)
      return dis
    }
  }else{
  //show_debug_message("300")
  return 300
  }
}
//show_debug_message(dis)
return 0
