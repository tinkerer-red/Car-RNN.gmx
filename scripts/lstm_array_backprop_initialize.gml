///lstm_array_backprop_initialize()


gradiant_vector = ds_list_create()
gradiant_vector_cell = ds_list_create()
held_weights = ds_grid_create(hidden_layer, output_layer)
cost = ds_list_create()
