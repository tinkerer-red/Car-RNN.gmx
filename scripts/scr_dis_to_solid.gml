///scr_dis_to_solid(direction)


var i = 15;
var dis = 0;

while true
{
  if (collision_line(x,y,x+lengthdir_x(i, argument0),y+lengthdir_y(i, argument0),obj_wall,0,1))
     || (i > 300)
  {
   break;
  }
  i += 15
}

return i
