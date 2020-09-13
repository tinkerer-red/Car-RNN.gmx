///rnn_feedforward()

//Reference Video:  https://www.youtube.com/watch?v=LHXXI4-IEns


//Hidden Layer  //in the sudo code this would be the rnn() function
//RNN Cell
    for(var i=0; i<array_length_1d(neurons); i++){
        neurons[i] = 0;
        for(var j=0; j<array_length_1d(inputs); j++){
            neurons[i] += inputs[j]*weights[i, j];
        }
        
        //Activation function
        neurons[i] = tanh(neurons[i]);
    }

//Output Nodes     //in the sudo code this would be the feedforward() function
    for(var i=0; i<array_length_1d(outputs); i++){
        outputs[i] = 0;
        for(var j=0; j<array_length_1d(neurons); j++){
            outputs[i] += neurons[j]*output_weights[i, j];
        }
        
        //Activation function
        outputs[i] = tanh(outputs[i]);
    }
