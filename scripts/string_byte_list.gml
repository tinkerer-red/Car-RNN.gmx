/// string_byte_list(str)

//  returns a DSList with the bytes of a string

var _string = argument0;

var _list = ds_list_create()

while (string_length(_string) != 0){
  var _byte = string_byte_at(_string, 0);
  ds_list_add(_list, _byte);
  _string = string_delete(_string, 1, 1);
}


return _list
