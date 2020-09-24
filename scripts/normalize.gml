///normalize(input, min, max)


// if the input is an array
if is_array(argument0){
  var _x = argument0
  var _ans = 0
  ///for each cell in the final array
  for (var i = 0; i < array_length_2d(_x,0); i++){
    for (var j = 0; j < array_height_2d(_x); j++){
      // initialize the cell
      _ans[j,i] = (_x[j,i]-argument1)/(argument2-argument1); //a1[i,j] * r;
    }
  }
  return(_ans);
}

// if the input is a real value
if is_real(argument0){
var _x = (argument0-argument1)/(argument2-argument1);
return(_x);
}
