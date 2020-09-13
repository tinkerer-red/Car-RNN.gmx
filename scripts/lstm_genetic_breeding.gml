///lstm_genetic_breeding(fittest_simulation)


var fit = argument0

//Weights for hidden layer
    for(var i=0; i<hidden_layer; i++){       
        for(var j=0; j<input_layer; j++){
            weights[i, j] = mean(weights[i, j], fit.weights[i, j]);
        }
    }
    
//Weights for output
    for(var i=0; i<output_layer; i++){      
        for(var j=0; j<hidden_layer; j++){
            output_weights[i, j] = mean(output_weights[i, j], fit.output_weights[i, j]);
        }
    }  

//Cell State Layer    
    for(var i=0; i<array_length_1d(neurons); i++){
        for(var j=0; j<array_length_1d(inputs); j++){
            cell_state[i, j] = mean(cell_state[i, j], fit.cell_state[i, j]);
        }
    }
