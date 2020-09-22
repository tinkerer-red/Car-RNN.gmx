///array_add(array, value)

// [value] can be either a real value or an array

var _ans;

// if the input is an array
if is_array(argument0){
  var _x = argument0
  
  if is_real(argument1){
    ///for each cell in the final array
    for (var i = 0; i < array_length_2d(_x,0); i++){
      for (var j = 0; j < array_height_2d(_x); j++){
        // initialize the cell
        _ans[i,j] = _x[i,j]+argument1; //a1[i,j];
      }
    }
    return(_ans);
  }
  
  // if arg1 is an array
  if is_array(argument1){ //this function will throw errors unless you have the exact same size arrays being added together, keep this in mind
    _y = argument1
    ///for each cell in the final array
    for (var i = 0; i < array_length_2d(_x,0); i++){
      for (var j = 0; j < array_height_2d(_x); j++){
        // initialize the cell
        _ans[i,j] = _x[i,j]+_y[i,j]; //a1[i,j];
      }
    }
    return(_ans);
  }
}

// if the input is a real value
if is_real(argument0){
var _x = argument0+argument1;
return(_x);
}
