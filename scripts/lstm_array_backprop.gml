///lstm_array_backprop(learning_rate)

//this version tries to mimic the use of vector math by using arrays

//Reference Video:  https://www.youtube.com/watch?v=8HyCNIVRbSU&list=PLPVQ5NVokFdRulZElCQI_lAptMliO7ODd&index=4&t=0s

//Learning Rate: This value will need to be accesible in the future, but for now this is a good location for testing.
//learning rate is similar to the mutate percent chance, it basically declares how much it can be changed, to prevent it from over adjusting
// if the learning rate is to high the values will diverge, instead of becoming what we want them to be
learning_rate = argument0


//store this variable for use later
var each_output_weight_total = 0;
for(var j=0; j<ds_list_size(neurons); j++){
  for(var i=0; i<ds_list_size(outputs); i++){
    each_output_weight_total = array_add(output_weights[# i, j], each_output_weight_total)
    held_weights[# i, j] = output_weights[# i, j]
    //show_debug_message("original held_weights[# j,i] = "+string(held_weights[# j,i]))
  }
}
//show_debug_message("$$$$$$$$$$$$$$$$$$$$$$")
//show_debug_message(each_output_weight_total)
//show_debug_message("$$$$$$$$$$$$$$$$$$$$$$")


//Output Nodes Cost  
    for(var j=0; j<ds_list_size(neurons); j++){
        gradiant_vector[| j] = 0;
        for(var i=0; i<ds_list_size(outputs); i++){
            cost[| i] = calculate_cost(outputs[| i], desired_outputs[| i]);
        //show_debug_message("cost for "+string(i)+" = "+string(cost[| i]))
        
        dirivitive = array_point_divide(cost[| i], outputs[| i])
        //show_debug_message("dirivitive for "+string(i)+" = "+string(dirivitive))
        
        gradiant_vector[| j] = array_add(
                                 array_multiply_real(neurons[| j], dirivitive)
                                 , gradiant_vector[| j])
        
        
        //show_debug_message("output_weights[# "+string(i)+", "+string(j)+"] = "+string(output_weights[# i, j]))
        output_weights[# i, j] = array_add(
                                   array_multiply_real(
                                     array_multiply_real(gradiant_vector[| j], learning_rate)
                                     , -1)
                                   , output_weights[#i, j])
                                   
      }
    }


    
    

//Hiddeon Layer's Costs
for(var j=0; j<ds_list_size(neurons); j++){
  for(var i=0; i<ds_list_size(outputs); i++){
    held_weights[# i, j] = array_multiply(held_weights[# i, j], cost[| i])
  }
}
//show_debug_message("right after matrix math held_weights[# j,i] = "+string(held_weights[# 0,0]))






//    for(var i=0; i<ds_list_size(outputs); i++){
    //h1_cost = ((w11 / (w11 + w12)) * output1_cost)  + ((w21 / (w21 + w22)) * output2_cost)
        var hidden_cost = 0;
        for(var j=0; j<ds_list_size(neurons); j++){
            //(w11 / (w11 + w12)) * output1_cost)
            
            //var output_cost = calculate_cost(outputs[| j], desired_outputs[| j]);
            
            gradiant_vector[| j] = 0;
            gradiant_vector_cell[| i] = 0;
            
            for(var i=0; i<ds_list_size(outputs); i++){
            //h1_cost += ((w11 / (w11 + w12)) * output1_cost)
            
              hidden_cost = array_add(held_weights[# i,j], hidden_cost)
            }
       
        dirivitive = array_point_divide(hidden_cost , neurons[| j])
        
        
/// apply cost gradient to each input weight
    for(var i=0; i<ds_list_size(inputs); i++){
        gradiant_vector[| i] = array_add(
                                 array_multiply_real(inputs[| i], dirivitive)
                                 , gradiant_vector[| i])
        //*
        gradiant_vector_cell[| i] = array_add(
                                 array_multiply_real(inputs[| i], dirivitive)
                                 , gradiant_vector_cell[| j])
        //*
        //show_debug_message("weights[# "+string(j)+", "+string(i)+"] = "+string(weights[# j, i]))
        weights[# j, i] = array_add(
                            array_multiply_real(
                              array_multiply_real(gradiant_vector[| i], learning_rate)
                              , -1)
                            , weights[# j, i])
        //*
        //show_debug_message("gradiant_vector_cell[| i] = "+string(gradiant_vector_cell[| i]))
        //show_debug_message("cell_state[# j, i] = "+string(cell_state[# j, i]))
        cell_state[# j, i] = array_add(
                            array_multiply_real(
                              array_multiply_real(gradiant_vector_cell[| i], learning_rate)
                              , -1)
                            , cell_state[# j, i])
        //*/
      }        
        
        
        }
//    }
        
            
/*            
            
            
            
            
            
            
        //clear arrays
        var sigmoid_gates = 0;
        neurons[| i] = 0;
        
        for(var j=0; j<ds_list_size(inputs); j++){
            var input = ds_list_find_value(inputs,j);
            
            
//Forget Gate
            sigmoid_gates = array_add(input,prev_output);
            sigmoid_gates = sigmoid(sigmoid_gates);
            

//Input Gate
//this is the same thing as the forget gate so we use the value sigmoid gates to cut down on calculations
            //input_gate_output = input+prev_output;
            //input_gate_output = sigmoid(input_gate_output)

                        
//Candidate Gate            
            var candidate = 0;
            candidate = array_add(input,prev_output);
            candidate = tanh(candidate)
            
            
//Cell State
            cell_state[# i, j] =  array_add(array_multiply_real(sigmoid_gates,candidate) , array_multiply_real(sigmoid_gates,prev_cell_state))


//LSTM Output Gate
            neurons[| i] = array_add(array_multiply_real(input,(array_multiply_real(sigmoid_gates,tanh(cell_state[# i, j])))), neurons[| i]);


//Set the previous node outputs            
            prev_cell_state = cell_state[# i, j];
            prev_output = weights[i, j];
            
        }
        
        //Activation function
        neurons[| i] = tanh(neurons[| i])
    }
    
    
    
        



