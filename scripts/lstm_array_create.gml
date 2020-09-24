///lstm_array_create(inputs, hidden_layers, outputs, array_size)

input_layer = argument0; //How many input nodes
hidden_layer = argument1; //How many hidden layer neuron
output_layer = argument2; //How many output layer neuron
array_size = argument3; //How large the input array can be

//Input Layer
    inputs = ds_list_create()  //we need to do it this way do to a bug with gamemaker studio not being able to put an array inside another array properly.
    desired_outputs = ds_list_create()
    
//Hidden Layer    
    neurons = ds_list_create()
    weights = ds_grid_create(hidden_layer, input_layer)
    for(var i=0; i<hidden_layer; i++){    
        neurons[| i] = 0;
        for(var j=0; j<input_layer; j++){
            var array = 0;
            for(var k=0; k<array_size; k++){
                array[k] = 0
            }
            weights[# i, j] = array;
        }
    }
    
//Output Layer    
    outputs = ds_list_create()
    output_weights = ds_grid_create(output_layer, hidden_layer)
    for(var i=0; i<output_layer; i++){
        outputs[| i] = 0;
        for(var j=0; j<hidden_layer; j++){
            for(var k=0; k<array_size; k++){
                array[k] = 0
            }
            output_weights[# i, j] = array;
        }
    }

//Cell State Layer    
    cell_state = ds_grid_create(hidden_layer, input_layer)
    for(var i=0; i<array_length_1d(hidden_layer); i++){
        for(var j=0; j<array_length_1d(input_layer); j++){
            cell_state[# i, j] = 0;
        }
    }
