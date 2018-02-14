if variable_instance_exists(id, "fg") {
	if floop_group_exists(fg) {
		show_debug_message("Destroying floop group...");
		floop_group_destroy(fg);
	}
}