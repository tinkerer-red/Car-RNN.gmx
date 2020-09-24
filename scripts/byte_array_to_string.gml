///byte_array_to_string(array)

var array = argument0
var _str = ""

for(var i = 0; i < array_length_1d(array); i++){
  _str += chr(array[i]);
}

return _str
