/// scr_lstm_load(filename)


var _filename = argument[0];

//load neurons
var _buffer = buffer_load( _filename );
var _json = buffer_read( _buffer, buffer_string );
buffer_delete( _buffer );

var _map = json_decode( _json);



//forget layer
var forget_layer_weights_list = _map[? "forget_layer_weights"]

//safety check
if ds_list_size(forget_layer_weights_list) != input_layer{
  show_message("Loaded Forget Layer neurons are not equal to the number of current Forget Layer neurons")
}

for(var i=0; i<input_layer; i++){
    cell_state[i] = ds_list_find_value(forget_layer_weights_list, 0)
    ds_list_delete(forget_layer_weights_list, 0)
}



//Hidden Layer    
var hidden_layer_weights_list = _map[? "hidden_layer_weights"]

//safety check
if ds_list_size(hidden_layer_weights_list) != hidden_layer*input_layer{
  show_message("Loaded Hidden Layer neurons are not equal to the number of current Hidden Layer neurons")
}

for(var i=0; i<hidden_layer; i++){    
  
  for(var j=0; j<input_layer; j++){
    weights[i, j] = ds_list_find_value(hidden_layer_weights_list, 0)
    ds_list_delete(hidden_layer_weights_list, 0)
  }
}

    
//Output Layer    
var output_layer_weights_list = _map[? "output_layer_weights"]

//safety check
if ds_list_size(output_layer_weights_list) != hidden_layer*output_layer{
  show_message("Loaded Output Layer neurons are not equal to the number of current Output Layer neurons")
}

for(var i=0; i<output_layer; i++){
  for(var j=0; j<hidden_layer; j++){
    output_weights[i, j] = ds_list_find_value(output_layer_weights_list, 0)
    ds_list_delete(output_layer_weights_list, 0)
  }
}


//Clean up
ds_map_destroy(_map)



