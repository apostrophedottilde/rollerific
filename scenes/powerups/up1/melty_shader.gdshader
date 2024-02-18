shader_type spatial;

void vertex() {
	VERTEX.x += sin(TIME * 10.0 + VERTEX.y * 2.0) * 0.1;
	VERTEX.y += cos(TIME * 2.0 + VERTEX.x + VERTEX.z * 1.0) * 0.05;
	VERTEX.z += sin(TIME * 2.0 + VERTEX.y + VERTEX.z * 1.0) * 0.1;
}

void fragment() {
	if(UV.x > sin(TIME * 2.0)) {
		EMISSION = vec3(0.0, sin(TIME * 0.8), 0.7);
		ALBEDO = vec3(0.4, sin(TIME * 0.8), 0.2);
		ROUGHNESS = .2;
		METALLIC = 0.0;
		RIM = 1.0;
	} else {
		ALBEDO = vec3(0.0, 0.5, 0.7);
		ROUGHNESS = 0.2;
		METALLIC = 1.0;
		RIM = 1.0;
	}
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
