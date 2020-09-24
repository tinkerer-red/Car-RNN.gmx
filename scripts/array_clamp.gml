///array_clamp(array, min, max)

// [value] can be either a real value or an array

var _ans;

// if the input is an array
if is_array(argument0){
  var _x = argument0
  
    ///for each cell in the final array
    for (var i = 0; i < array_length_2d(_x,0); i++){
      for (var j = 0; j < array_height_2d(_x); j++){
        // initialize the cell
        _ans[j,i] = clamp(_x[j,i], argument1, argument2); //a1[j,i];
      }
    }
    return(_ans);
  
}

// if the input is a real value
if is_real(argument0){
var _x = clamp(argument0, argument1, argument2);
return(_x);
}
