shader_type spatial;

void vertex() {
	//VERTEX.z = VERTEX.y + (PI * sin(TIME * PI + VERTEX.x) / 4.0);
	VERTEX.z = sin(TIME / distance(vec3(0.0, VERTEX.z, 0.0), VERTEX) * 3.0) * 0.15;
}

void fragment() {
	ALBEDO = vec3(0.3, 0.5, 8.0);
	METALLIC = .2;
	ALPHA = 0.8;
	ROUGHNESS = 0.15;
	SPECULAR = 0.6;
	//EMISSION = vec3(0.0, 0.0, 0.0);
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
