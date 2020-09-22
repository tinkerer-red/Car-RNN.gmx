///lstm_array_create(inputs, hidden_layers, outputs)

input_layer = argument0; //How many input nodes
hidden_layer = argument1; //How many hidden layer neuron
output_layer = argument2; //How many output layer neuron
    
//Input Layer
    inputs = ds_list_create()  //we need to do it this way do to a bug with gamemaker studio not being able to put an array inside another array properly.
    
//Hidden Layer    
    neurons = ds_list_create()
    for(var i=0; i<hidden_layer; i++){    
        neurons[| i] = 0;
        for(var j=0; j<input_layer; j++){
            weights[i, j] = 0;
        }
    }
    
//Output Layer    
    outputs = ds_list_create()
    for(var i=0; i<output_layer; i++){
        outputs[| i] = 0;
        for(var j=0; j<hidden_layer; j++){
            output_weights[i, j] = 0;
        }
    }

//Cell State Layer    
    cell_state = ds_grid_create(hidden_layer, input_layer)
    for(var i=0; i<array_length_1d(hidden_layer); i++){
        for(var j=0; j<array_length_1d(input_layer); j++){
            cell_state[# i, j] = 0;
        }
    }
