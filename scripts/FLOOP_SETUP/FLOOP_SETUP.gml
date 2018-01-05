/// @desc floop setup values
// THIS DOES NOT NEED TO BE RUN

enum eases {
	sudden,
	
	linear,
	
	sine_in,
	sine_out,
	sine_inout,
	
	quad_in,
	quad_out,
	quad_inout,
	
	cube_in,
	cube_out,
	cube_inout,
	
	quart_in,
	quart_out,
	quart_inout,
	
	quint_in,
	quint_out,
	quint_inout,
	
	expo_in,
	expo_out,
	expo_inout,
	
	circ_in,
	circ_out,
	circ_inout,
	
	back_in,
	back_out,
	back_inout,
	
	elastic_in,
	elastic_out,
	elastic_inout,
	
	bounce_in,
	bounce_out,
	bounce_inout
}

// Run this globally on start
gml_pragma("global", "FLOOP_SETUP()");