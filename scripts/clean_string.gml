///clean_string(str)

//  this function just removes all letters and charactors which are not in the english language

var _str = argument0;

for (var i = string_length(_str); i >= 0; i--){
  var _byte = string_byte_at(_str, i);
  if ((_byte >= 32) && (_byte <= 126)) //english alphabet, and common charactors
      || (_byte = 10) //new line
      || (_byte = 9) //tab
  {
    //show_debug_message("_byte = "+string(_byte))
    continue;
  }else{
    //show_debug_message("_byte = "+string(_byte))
    _str = string_delete(_str, i, 1)
  }
}

return _str;
