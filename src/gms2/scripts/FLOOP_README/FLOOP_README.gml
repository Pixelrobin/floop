/// @shipit

/// @desc floop README and setup (Doesn't need to be run)

/*
	floop-gms
	By Michael Savchuk (pixelrobin)
	
	Documentation: [INSERT GITHUB LINK]
*/




///////////////////////////////////////////////////////////
// YOU CAN CHANGE THESE IF YOU WANT                      //
///////////////////////////////////////////////////////////

// Used for default values for optional values in eases
#macro FLOOP_DEFAULT_BACK 1
#macro FLOOP_DEFAULT_P_MULTIPLIER 0.3




///////////////////////////////////////////////////////////
// YOU PROBABLY SHOULDN'T CHANGE THESE                   //
///////////////////////////////////////////////////////////

// Misc macros
#macro FLOOP_ALL ""
#macro FLOOP_TOTAL_EASES 31

enum eases {
	sudden,        // 0
	
	linear,        // 1
	
	sine_in,       // 2
	sine_out,      // 3
	sine_inout,    // 4
	
	quad_in,       // 5
	quad_out,      // 6
	quad_inout,    // 7
	
	cube_in,       // 8
	cube_out,      // 9
	cube_inout,    // 10
	
	quart_in,      // 11
	quart_out,     // 12
	quart_inout,   // 13
	
	quint_in,      // 14
	quint_out,     // 15
	quint_inout,   // 16
	
	expo_in,       // 17
	expo_out,      // 18
	expo_inout,    // 19
	
	circ_in,       // 20
	circ_out,      // 21
	circ_inout,    // 22
	
	back_in,       // 23
	back_out,      // 24
	back_inout,    // 25
	
	elastic_in,    // 26
	elastic_out,   // 27
	elastic_inout, // 28
	
	bounce_in,     // 29
	bounce_out,    // 30
	bounce_inout   // 31
}

enum loops {
	none,
	replay,
	patrol
}