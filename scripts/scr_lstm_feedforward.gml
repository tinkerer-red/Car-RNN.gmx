///scr_lstm_feedforward()

//Reference Video:  https://www.youtube.com/watch?v=8HyCNIVRbSU&list=PLPVQ5NVokFdRulZElCQI_lAptMliO7ODd&index=4&t=0s

//LSTM Cell
    for(var i=0; i<array_length_1d(neurons); i++){
        
        //clear arrays
        forget_gate_output[i] = 0;
        input_gate_output[i] = 0;
        candidate[i] = 0;
        neurons[i] = 0;
        //cell_state[i, j] = 0;
        
        for(var j=0; j<array_length_1d(inputs); j++){
            var prev_output = weights[i, j];
            var prev_cell_state = cell_state[i, j];
            show_debug_message("prev_cell_state = "+string(prev_cell_state))
        
            
        
//Forget Gate
            forget_gate_output[i] = inputs[j]+prev_output;
            forget_gate_output[i] = sigmoid(forget_gate_output[i]);


//Input Gate
            input_gate_output[i] = inputs[j]+prev_output;
            input_gate_output[i] = sigmoid(input_gate_output[i])
            
//Candidate Gate            
            candidate[i] = inputs[j]+prev_output;
            candidate[i] = tanh(candidate[i])
            
    
//Cell State
            cell_state[i, j] = forget_gate_output[i]*prev_cell_state + input_gate_output[i]*candidate[i]
            
            
//LSTM Output Gate
            weights[i, j] = input_gate_output[i]*tanh(cell_state[i, j])
            
            neurons[i] += inputs[j]*weights[i, j];
            neurons[i] = tanh(neurons[i])
        }
    }        
        
//Output Nodes   
    for(var i=0; i<array_length_1d(outputs); i++){
        outputs[i] = 0;
        for(var j=0; j<array_length_1d(neurons); j++){
            outputs[i] = neurons[i]*output_weights[i, j];
        }
        
        //Activation function
        outputs[i] = tanh(outputs[i]);
    }
