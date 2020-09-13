///scr_lstm_feedforward()

//Reference Video:  https://www.youtube.com/watch?v=8HyCNIVRbSU&list=PLPVQ5NVokFdRulZElCQI_lAptMliO7ODd&index=4&t=0s

//LSTM Cell
    var prev_output = 0;
    var prev_cell_state = 0;
    for(var i=0; i<array_length_1d(neurons); i++){
        
        //clear arrays
        var sigmoid_gates = 0;
        var input_gate_output = 0;
        var candidate = 0;
        neurons[i] = 0;
        //cell_state[i, j] = 0;
        
        for(var j=0; j<array_length_1d(inputs); j++){
            var input = inputs[j];
            
            
//Forget Gate
            sigmoid_gates = input+prev_output;
            sigmoid_gates = sigmoid(sigmoid_gates);
            
//Input Gate
//this is the same thing as the forget gate so we use the value sigmoid gates to cut down on calculations
            //input_gate_output = input+prev_output;
            //input_gate_output = sigmoid(input_gate_output)
            
//Candidate Gate            
            candidate = input+prev_output;
            candidate = tanh(candidate)
            
            
//Cell State
            cell_state[i, j] = sigmoid_gates*prev_cell_state + sigmoid_gates*candidate
            
//LSTM Output Gate
            neurons[i] += input*(sigmoid_gates*tanh(cell_state[i, j]));
            
//Set the previous outputs            
            prev_cell_state = cell_state[i, j];
            prev_output = weights[i, j];
            
        }
        
        //Activation function
        neurons[i] = tanh(neurons[i])
        
    }

    
    
        
//Output Nodes   
    for(var i=0; i<array_length_1d(outputs); i++){
        outputs[i] = 0;
        for(var j=0; j<array_length_1d(neurons); j++){
            outputs[i] += neurons[j]*output_weights[i, j];
            
        }
        
        //Activation function
        outputs[i] = tanh(outputs[i]);
    }





