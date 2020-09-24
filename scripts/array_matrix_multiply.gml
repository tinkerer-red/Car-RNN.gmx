///array_matrix_multiply(ds_grid_weights, ds_list_cost)

/// Both arays must be perfect squares equalling the same size. [2,2] * [2,2] for example
//    a off set matrix of [2,3]*[2,3] would not work

///   although it is possible to multiply a [2,3]*[3,2] The script may not support this (we'll see)



for (var i = 0; i < ds_grid_width(argument0) ; i++){
  for (var j = 0; j < ds_grid_height(argument0); j++){
    var a1 = argument0[# j,i]
        
        
    for (var k = 0; k < array_length_2d(a1, 0); k++){
      var a2 = argument1[| k];
      
      argument0[# j,i] = array_multiply(a1, a2)
      //show_debug_message("argument0[# "+string(j)+", i] = "+string(argument0[# j,i]))
    }  
    //show_debug_message("argument0[# j,i] = "+string(argument0[# j,i]))
  }
}

//return final_array;
        
        
    
