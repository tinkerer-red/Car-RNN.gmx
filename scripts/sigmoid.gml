/// sigmoid(x)

var _x = argument0
var e = 2.71828182846

// if the input is an array
if is_array(_x){
  var _ans;
  ///for each cell in the final array
  for (var i = 0; i < array_length_2d(_x,0); i++){
    for (var j = 0; j < array_height_2d(_x); j++){
      // initialize the cell
      _ans[j,i] = 1/(1+power(e, -_x[j,i])); //a1[j,i] * r;
    }
  }
  return(_ans);
}

// if the input is a real value
if is_real(_x){
  return 1/(1+power(e, -_x))
}
