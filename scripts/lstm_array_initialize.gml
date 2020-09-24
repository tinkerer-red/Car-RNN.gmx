///lstm_array_initialize()


//Weights for hidden layer
    for(var i=0; i<hidden_layer; i++){       
        for(var j=0; j<input_layer; j++){
            for(var k=0; k<array_size; k++){
                array[k] = random_range(-1, 1);
            }
            weights[# i, j] = array;
        }
    }

//Weights for cell state
    for(var i=0; i<hidden_layer; i++){       
        for(var j=0; j<input_layer; j++){
            for(var k=0; k<array_size; k++){
                array[k] = random_range(-1, 1);
            }
            cell_state[# i, j] = array;
        }
    }
    
//Weights for output
    for(var i=0; i<output_layer; i++){      
        for(var j=0; j<hidden_layer; j++){
            for(var k=0; k<array_size; k++){
                array[k] = random_range(-1, 1);
            }
            output_weights[# i, j] = array;
        }
    }  
show_debug_message(output_weights[# 0, 0])
