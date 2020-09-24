///string_to_data(str, del)

//  returns DSList, holding arrays, which hold the bytes of each word

var _str = argument0
var del = argument1
var del_length = string_length(del)

var temp_str;

var list = ds_list_create()

var largest_word_size = 0
var largest_word = ""

var pos = string_pos(del, _str)-1
largest_word_size = pos

while pos > 0 {
  temp_str = string_copy(_str, 1, pos)
  _str = string_delete(_str, 1, pos+del_length)
  
  var byte_array = string_byte_array(temp_str, array_size)
  
  ds_list_add(list, byte_array)
  
  if (pos > largest_word_size){
    largest_word_size = pos
    largest_word = temp_str
  }
  
  pos = string_pos(del, _str)-1
  
}

//then add the left over word
var byte_array = string_byte_array(_str, 15)
ds_list_add(list, byte_array)

// debuging strings
if (string_length(_str) > largest_word_size){
  largest_word_size = string_length(_str)
  largest_word = _str
}
show_debug_message("largest_word = "+largest_word)
show_debug_message("largest_word_size = "+string(largest_word_size))

return list;

  
