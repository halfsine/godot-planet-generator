shader_type sky;

uniform sampler2D stars;

void sky() {
	COLOR = texture(stars, SKY_COORDS * 2.0).rgb;
}
