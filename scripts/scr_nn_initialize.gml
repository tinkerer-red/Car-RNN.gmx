///scr_nn_initialize()

//Weights for hidden layer
    for(var i=0; i<hidden_layer; i++){       
        for(var j=0; j<input_layer; j++){
            weights[i, j] = random_range(-1.0, 1.0);
        }
    }
    
//Weights for output
    for(var i=0; i<output_layer; i++){      
        for(var j=0; j<hidden_layer; j++){
            output_weights[i, j] = random_range(-1.0, 1.0);
        }
    }  
