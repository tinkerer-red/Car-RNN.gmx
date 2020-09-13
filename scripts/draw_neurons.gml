///draw_neurons(x1,y1.x2.y2)

var x1 = argument0
var y1 = argument1
var x2 = argument2
var y2 = argument3

var neuron_count = hidden_layer
var input_count = input_layer
var output_count = output_layer

if (neuron_count = 0) ||
   (input_count = 0)  ||
   (output_count = 0) {
       show_debug_message("0 is not a valid input, neuron, or output count.")
       return 0;
   }

var circle_radious = ((y2-y1)/max(neuron_count, input_count, output_count))/2

var input_coord_array  = 0
var output_coord_array = 0
var neuron_coord_array = 0


//draw the box
draw_set_color(c_white)
draw_rectangle(x1,y1,x2,y2,true)


//draw input layers
var inputs_spacing = (y2-y1)/input_count
var inputs_radious = inputs_spacing/2

for(var i = 0; i < input_count; i++){
    draw_circle(x1+circle_radious, (y1+inputs_radious)+inputs_spacing*i, circle_radious, 0)
    input_coord_array[i,0] = x1+inputs_radious
    input_coord_array[i,1] = (y1+inputs_radious)+inputs_spacing*i
}


//draw hidden layers
var neuron_spacing = (y2-y1)/neuron_count
var neuron_radious = neuron_spacing/2

for(var i = 0; i < neuron_count; i++){
    draw_circle(x1+(x2-x1)/2, (y1+neuron_radious)+neuron_spacing*i, circle_radious, 0)
    neuron_coord_array[i,0] = x1+(x2-x1)/2
    neuron_coord_array[i,1] = (y1+neuron_radious)+neuron_spacing*i
}


//draw output nodes
var outputs_spacing = (y2-y1)/output_count
var outputs_radious = outputs_spacing/2

for(var i = 0; i < output_count; i++){
    draw_circle(x2-circle_radious, (y1+outputs_radious)+outputs_spacing*i, circle_radious, 0)
    output_coord_array[i,0] = x2-circle_radious
    output_coord_array[i,1] = (y1+outputs_radious)+outputs_spacing*i
}





//Draw weights from input to hidden layer nodes
for(var i=0; i<hidden_layer; i++){    
  for(var j=0; j<input_layer; j++){
    var weight = clamp(weights[i, j], -1, 1)
    
    var green = max(0, 255*weight)
    var red = max(0, 255*weight*-1)
    
    color = make_colour_rgb(red, green, 127);
    draw_set_color(color)
    draw_line(input_coord_array[j,0], input_coord_array[j,1], neuron_coord_array[i,0], neuron_coord_array[i,1])
  }
}

    
//Output Layer    
for(var i=0; i<output_layer; i++){
  for(var j=0; j<hidden_layer; j++){
    var weight = clamp(output_weights[i, j], -1, 1)
    
    var green = max(0, 255*weight)
    var red = max(0, 255*weight*-1)
    
    color = make_colour_rgb(red, green, 127);
    draw_set_color(color)
    draw_line(output_coord_array[i,0], output_coord_array[i,1], neuron_coord_array[j,0], neuron_coord_array[j,1])
  }
}






