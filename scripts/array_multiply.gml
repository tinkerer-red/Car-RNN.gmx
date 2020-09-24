///array_multiply(array1, array2)

/// Both arays must be perfect squares equalling the same size. [2,2] * [2,2] for example
//    a off set matrix of [2,3]*[2,3] would not work

///   although it is possible to multiply a [2,3]*[3,2] The script may not support this (we'll see)

var a1 = argument0
    a2 = argument1

/// make sure they are arrays    
if !is_array(a1) || !is_array(a2){
  //show_debug_message("[LOG] [array_multiply] These values are not arrays")
}

/// make sure they are the same sizes
if array_height_2d(a1) != array_length_2d(a2, 0){
  //show_debug_message("[LOG] [array_multiply] Array 1's height != Array 2's length")
}

//define the new array
var final_array = 0
var length = array_length_2d(a1, 0);
var height = array_height_2d(a1);

//final_array[length,height] = 0;

///for each cell in the final array
for (var i = 0; i < length; i++){
  for (var j = 0; j < height; j++){
    // initialize the cell
    final_array[j,i] = 0;
    
    //cycle through the length of array 1, which is also the height of array 2
    for (var k = 0; k < array_length_2d(a2, 0); k++){
      final_array[j,i] += a1[j,i] * a2[j,k]
    }
  }
}


return final_array;



