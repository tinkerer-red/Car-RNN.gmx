/// scr_nn_save(filename)


var _filename = argument[0];



var _map = ds_map_create()

//Hidden Layer    
var _list = ds_list_create()

for(var i=0; i<hidden_layer; i++){    
  for(var j=0; j<input_layer; j++){
    ds_list_add(_list,  weights[i, j]);
  }
}

ds_map_add_list(_map, "hidden_layer_weights", _list)

    
//Output Layer    
var _list = ds_list_create()

for(var i=0; i<output_layer; i++){
  for(var j=0; j<hidden_layer; j++){
    ds_list_add(_list,  output_weights[i, j]);
  }
}

ds_map_add_list(_map, "output_layer_weights", _list)

//Encode
var _json = json_encode(_map)

//Save
var _buffer = buffer_create( string_byte_length(_json)+1, buffer_fixed, 1);
buffer_write(_buffer, buffer_string, _json);
buffer_save(_buffer, _filename);
buffer_delete(_buffer);

ds_map_destroy(_map)



