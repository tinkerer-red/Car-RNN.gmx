///scr_nn_create(inputs, hidden_layers, outputs)

input_layer = argument0; //How many input nodes
hidden_layer = argument1; //How many hidden layer neuron
output_layer = argument2; //How many output layer neuron
    
//Input Layer
    for(var i=0; i<input_layer; i++){
        inputs[i] = 0;
    }
    
//Hidden Layer    
    for(var i=0; i<hidden_layer; i++){    
        neurons[i] = 0;
        for(var j=0; j<input_layer; j++){
            weights[i, j] = 0;
        }
    }
    
//Output Layer    
    for(var i=0; i<output_layer; i++){
        outputs[i] = 0;
        for(var j=0; j<hidden_layer; j++){
            output_weights[i, j] = 0;
        }
    }
