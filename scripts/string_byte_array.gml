/// string_byte_array(str, [count])

//  returns a array holding the bytes of a string 
// array > byte

/*
    str      = the string to split
    count    = (optional) the number of letters the array shall hold maximum (default 15, for the word "Inconsequential" which is really the largest word that could commonly be used)
*/

// the max letters needs to be set otherwise you would end up doing vector math on non fitting arrays.

var _string = argument0;
if (argument_count = 2) {
  var letters = argument1;
}else{
  var letters = 15;
}

var _list;
var i = 0;

//pad the end of the string with the delimiter to fit inside the input length perfectly
while (string_length(_string) < letters){
  _string += " "
}

while (string_length(_string) != 0){
  var _byte = string_byte_at(_string, 0);
  _list[i] =  _byte;
  _string = string_delete(_string, 1, 1);
  i++
  
  if (i = letters) break;
}

return _list
