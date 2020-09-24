/// calculate_cost(output, desired_output)

/// cost = (output - desired_output)^2
// add array support

var output = argument0;
var desired_output = argument1;

if is_array(argument0){
  var _x = argument0
  
  if is_array(argument1){
    var _y = argument1
    ///for each cell in the final array
    for (var i = 0; i < array_length_2d(_x,0); i++){
      for (var j = 0; j < array_height_2d(_x); j++){
        // initialize the cell
        _ans[j,i] = power((_x[j,i]-_y[j,i]), 2); //a1[j,i];
      }
    }
    return(_ans);
  }
}

/// if both are real
var cost = power((output - desired_output), 2)

return cost;
